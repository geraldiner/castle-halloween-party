local sti = require 'lib/sti'
local bump = require 'lib/bump'
local talkies = require 'lib/talkies'

local World = require 'world'
local bumpWorld = bump.newWorld()
local npc = require 'npc'

local COLUMNS = 16
local ROWS = 15
local TILE_SIZE = 16

local blocks = {} -- collision boxes (walls, doors, npcs)
local dialog = nil -- dialog for speaking with npcs
local room = {} -- current room player is in

-- set up player
local player = {
	facing = 'down',
	animation = nil,
	x = 96,
	y = 96,
	dx = 0,
	dy = 0,
	w = 32,
	h = 32,
	speed = 1.5,
	isMoving = false,
	party = {}
}

-- functions for blocks
local function addBlock(name, x, y, w, h, type, destination)
	local block = {name = name, x = x, y = y, w = w, h = h, type = type, destination = destination}
	blocks[#blocks+1] = block
	bumpWorld:add(block, x, y, w, h)
end

local function addBlocks(room)
	for k, d in pairs(room.walls) do
		addBlock(d.name, d.x,d.y,d.w,d.h,d.type,d.destination)
	end
	for l, w in pairs(room.doors) do
		addBlock(w.name, w.x, w.y, w.w, w.h,w.type,w.destination)
	end
	if room.npc ~= nil then
		local n = room.npc
		addBlock(n.name, n.x, n.y+16, n.w, n.h/2, n.type, nil)
	end
end

local function drawBlock(box, r, g, b, o)
	love.graphics.setColor(r, g, b, o)
	love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
	love.graphics.reset()
end

local function drawBlocks()
	for _,block in ipairs(blocks) do
		if block.type == 'door' then
			drawBlock(block, 0, 0, 0, 0)
		elseif block.type == 'wall' then
			drawBlock(block, 0, 0, 0, 0)
		end
	end
end

local function removeBlocks()
	for i = 1, #blocks do
		bumpWorld:remove(blocks[i])
		blocks[i] = nil
	end
end

-- sprite animation setup
function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image
    animation.quads = {}
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
    animation.duration = duration or 1
    animation.currentTime = 0
 
    return animation
end

-- player functions
local function updatePlayer(dt)
	local speed = player.speed
	local animation = player.animation

	if dialog == nil and love.keyboard.isDown({'right', 'left', 'up', 'down'}) then
		player.isMoving = true
		animation.currentTime = animation.currentTime + dt
		if animation.currentTime >= animation.duration then
			animation.currentTime = animation.currentTime - animation.duration
		end

		local dx, dy = 0, 0
		if love.keyboard.isDown('right') then
			dx = speed
		elseif love.keyboard.isDown('left') then
			dx = -speed
		elseif love.keyboard.isDown('down') then
			player.facing = 'down'
			dy = speed
		elseif love.keyboard.isDown('up') then
			dy = -speed
		end
		player.dx, player.dy = dx, dy
		
		if dx ~= 0 or dy ~= 0 then
			player.x, player.y, cols, cols_len = bumpWorld:move(player, player.x + dx, player.y + dy)
			for i=1, cols_len do
				local col = cols[i].other
				if col.type == 'door' then
					if col.destination == 'exit' then
						showEndGame()
						return
					else
						player.x, player.y = World:getPlayerSpawn(col)
						return col
					end
				else
					return nil
				end
			end
		end
	else
		player.isMoving = false
	end
end

local function drawPlayer()
	if player.isMoving and player.facing == 'down' then
		local spriteNum = math.floor(player.animation.currentTime / player.animation.duration * #player.animation.quads) + 1
		love.graphics.draw(player.animation.spriteSheet, player.animation.quads[spriteNum], player.x, player.y, 0, 1)
	else
		love.graphics.draw(player.animation.spriteSheet, player.animation.quads[1], player.x, player.y)
	end
	love.graphics.reset()
end

local function drawNPC(room)
	if room.npc ~= nil then
		love.graphics.draw(room.npc.sprite, room.npc.x, room.npc.y)
	end
end

-- Main L�VE functions
function love.load()
	love.graphics.setDefaultFilter('nearest','nearest')
	player.animation = newAnimation(love.graphics.newImage("assets/sprites/witch_spritesheet.png"), 32, 32, 0.75)
	bumpWorld:add(player, player.x,player.y,player.w-10, player.h)
	World:load()
	room = World:getRoom('study')
	removeBlocks()
	addBlocks(room)
end

function love.update(dt)
	local event = updatePlayer(dt)

	if event and event.type == 'door' then
		bumpWorld:update(player, player.x, player.y)
		removeBlocks()
		room = World:getRoom(event.destination)
		addBlocks(room)
	end
	talkies.update(dt)
end



function love.draw()
	room.map:drawTileLayer('Floor')
	room.map:drawTileLayer('InnerWalls')
	drawPlayer()
	drawNPC(room)
	room.map:drawTileLayer('OuterWalls')
	drawBlocks()
	talkies.draw()
end

function addToParty(item)
	item.isParty = true
	room.npc = nil
	player.party[#player.party+1] = item.name
	blocks[table.indexOf(blocks,item)] = nil
	bumpWorld:remove(item)
end

function love.keypressed(key)
	if key == "return" then
		if dialog == nil then --player is moving, want to detect npcs
			local items, len = bumpWorld:queryRect(player.x-1,player.y-1,player.w+2,player.h*2+2)
			if #items > 1 then
				player.isMoving = false --stop moving
				for i=1, len do
					if items[i].type == 'npc' then --npc detected
						dialog = talkies.say( --start talking
							"NPC",
							{"Lets go home", "Do you want to add npc to your party?"},
							{
								titleColor = {1,0,1},
								textSpeed = fast,
								options={
									{"Yes", function() addToParty(items[i])return end},
									{"No", function() return end}
								},
								onmessage=function() talkies.onAction() end,
								onmessage=talkies.onAction(),
								oncomplete=function() 
									dialog = nil
									talkies.clearMessages()
									player.isMoving = true
								end
							}
						)
					end
				end
			end
		else --player not moving
			talkies.onAction()
		end
	elseif key == "up" then talkies.prevOption()
	elseif key == "down" then talkies.nextOption()
	end
end

function showEndGame()
	print("THE GAME HAS ENDED")
end

function table.indexOf(t, object)
    if type(t) ~= "table" then error("table expected, got " .. type(t), 2) end

    for i, v in pairs(t) do
        if object == v then
            return i
        end
    end
end