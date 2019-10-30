local sti = require 'lib/sti'
local bump = require 'lib/bump'

local World = require 'world'

local bumpWorld = bump.newWorld()

-- Blocks aka 'collisions' functions
local blocks = {}

local function drawBlock(box, r, g, b)
	love.graphics.setColor(r, g, b, 0)
	love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
end

local function addBlock(name, x, y, w, h, isDoor, isWall, destination)
	local block = {name = name, x = x, y = y, w = w, h = h, isDoor = isDoor, isWall = isWall, destination = destination}
	blocks[#blocks+1] = block
	bumpWorld:add(block, x, y, w, h)
end

local function drawBlocks()
  for _,block in ipairs(blocks) do
	if block.isDoor then
		drawBlock(block, 255, 0, 0)
	else
		drawBlock(block, 0, 0, 255)
	end
  end
end

-- Player functions
local sprite = love.graphics.newImage('assets/sprites/char.png')
local player = {sprite = sprite, x = 96, y = 96, w = 16, h = 32, speed = 2.5 }

local function updatePlayer(dt)
  local speed = player.speed

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

	if dx ~= 0 or dy ~= 0 then
		local cols
		player.x, player.y, cols, cols_len = bumpWorld:move(player, player.x + dx, player.y + dy)
		for i=1, cols_len do
			local col = cols[i].other
			if col.isDoor then
				return col
			else
				return nil
			end
		end
	end
end

local function drawPlayer()
  	love.graphics.setColor(0, 255, 0)
	love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end

local room = {}

local function addDoorBlocks(room)
	room.doors = World:getDoors(room.map)
	for k, d in pairs(room.doors) do
		addBlock(d.name, d.x,d.y,d.w,d.h,true,false,d.destination)
	end
end

local function removeBlocks()
	for i = 1, #blocks do
		bumpWorld:remove(blocks[i])
		blocks[i] = nil
	end
end

local isStart = true

-- Main LÖVE functions
function love.load()
	bumpWorld:add(player, player.x, player.y, player.w, player.h)
	room = World:getRoom('study')
	removeBlocks()
	addDoorBlocks(room)
end

function love.update(dt)
  local event = updatePlayer(dt)
  if event and event.isDoor then
	isStart = false
	if event.name == 'South' then
		player.x, player.y = 96, 16
	elseif event.name == 'North' then
		player.x, player.y = 96, 184
	elseif event.name == 'West' then
		player.x, player.y = 184, 96
	elseif event.name == 'East' then
		player.x, player.y = 16, 96
	end
	removeBlocks()
	room = World:getRoom(event.destination)
	addDoorBlocks(room)
  end
end

function love.draw()
	room.map:draw()
	drawBlocks()
	drawPlayer()
end