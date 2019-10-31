local sti = require 'lib/sti'
local bump = require 'lib/bump'
local talkies = require 'lib/talkies'

local World = require 'world'

local bumpWorld = bump.newWorld()

-- Blocks aka 'collisions' functions
local blocks = {}

local function drawBlock(box, r, g, b, o)
	love.graphics.setColor(r, g, b, o)
	love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
	love.graphics.reset()
end

local function addBlock(name, x, y, w, h, type, destination)
	local block = {name = name, x = x, y = y, w = w, h = h, type = type, destination = destination}
	blocks[#blocks+1] = block
	bumpWorld:add(block, x, y, w, h)
end

local function drawBlocks()
	for _,block in ipairs(blocks) do
		if block.type == 'door' then
			drawBlock(block, 0, 0, 0, 0)
		elseif block.type == 'wall' then
			drawBlock(block, 0, 0, 0, 0)
		elseif block.type == 'npc' then
			drawBlock(block, 255, 0, 255, 100)
		end
	end
end

-- Player functions
local sprite = love.graphics.newImage("assets/sprites/witch.png")
local player = {sprite = sprite, x = 96, y = 96, dx = 0, dy = 0, w = 16, h = 16, speed = 1.5, isMoving = true, party = {}}

local function updatePlayer(dt)
	local speed = player.speed
	if player.isMoving then
	--print(player.x, player.y)
		local dx, dy = 0, 0
		if love.keyboard.isDown('right') then
			dx = speed
		elseif love.keyboard.isDown('left') then
			dx = -speed
		elseif love.keyboard.isDown('down') then
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
					if col.name == 'South' then
						if col.destination == 'exit' then
							showEndGame()
							break
						else
							player.x, player.y = 16*8, 16
						end
					elseif col.name == 'North' then
						player.x, player.y = 16*8, 16*13
					elseif col.name == 'West' then
						player.x, player.y = 16*13, 16*8
					elseif col.name == 'East' then
						player.x, player.y = 16, 16 *8
					end
					return col
				else
					return nil
				end
			end
		end
	end
end

local function drawPlayer()
	love.graphics.draw(player.sprite, player.x, player.y)
end

local room = {}

local function addBlocks(room)
	room.doors, room.walls = World:getDoorsAndWalls(room.map)
	for k, d in pairs(room.walls) do
		addBlock(d.name, d.x,d.y,d.w,d.h,d.type,d.destination)
	end
	for l, w in pairs(room.doors) do
		addBlock(w.name, w.x, w.y, w.w, w.h,w.type,w.destination)
	end
end

local function removeBlocks()
	for i = 1, #blocks do
		bumpWorld:remove(blocks[i])
		blocks[i] = nil
	end
end

local npc = {x = 16*11, y = 64, w = 16, h = 32, speed = 2.5 }


-- Main L�VE functions
function love.load()
	bumpWorld:add(player, player.x, player.y, 16, 16)
	room = World:getRoom('study')
	removeBlocks()
	addBlocks(room)
	addBlock('npc', npc.x, npc.y, npc.w, npc.h, 'npc', nil)
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
	room.map:drawTileLayer('OuterWalls')
	drawBlocks()
	talkies.draw()
end

function addToParty(item)
	player.party[#player.party+1] = item.name
	blocks[table.indexOf(blocks,item)] = nil
	bumpWorld:remove(item)
end

local dialog = nil
function love.keypressed(key)
	if key == "return" then
		if player.isMoving then --player is moving, want to detect npcs
			local items, len = bumpWorld:queryRect(player.x-1,player.y-1,player.w+2,player.h*2+2)
			for i=1, len do
				if items[i].name == 'npc' then --npc detected
					player.isMoving = false --stop moving
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