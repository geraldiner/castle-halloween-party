local sti = require 'lib/sti'
local bump = require 'lib/bump'
local npc = require 'npc'
local poster = require 'poster'

local World = {}

local DATA = {
  ['backyard'] = {
    map = sti('castle-halloween-party_backyard.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['bathroom'] = {
    map = sti('castle-halloween-party_bathroom.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['bedroom1'] = {
    map = sti('castle-halloween-party_bedroom1.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['bedroom2'] = {
    map = sti('castle-halloween-party_bedroom2.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['center-landing'] = {
    map = sti('castle-halloween-party_center-landing.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['den'] = {
    map = sti('castle-halloween-party_den.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['dining-room'] = {
    map = sti('castle-halloween-party_dining-room.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['family-room'] = {
    map = sti('castle-halloween-party_family-room.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['foyer'] = {
    map = sti('castle-halloween-party_foyer.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['hallway1'] = {
    map = sti('castle-halloween-party_hallway1.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['hallway2'] = {
    map = sti('castle-halloween-party_hallway2.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['hallway3'] = {
    map = sti('castle-halloween-party_hallway3.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['kitchen'] = {
    map = sti('castle-halloween-party_kitchen.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  },
  ['study'] = {
    map = sti('castle-halloween-party_study.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = nil,
	clue = nil
  }
}

function World:load()
	local keys = getTableKeys(DATA)
	local npcs = npc:getNpcKeys()
	local posters = poster:getPosterKeys()
	local count1 = #npcs
	local count2 = 1
	local randomRooms = getRandomNum(#keys)
	local randomClues = getRandomNum(#keys)
	local room
	for i = 1, #keys do
		room = DATA[keys[i]]
		self:setDoorsAndWalls(room)
		if checkValues(randomRooms, i) then
			setNPC(room, npcs[count1])
			count1 = count1-1
		end
		if checkValues(randomClues, i) then
			setClue(room, posters[count2])
			count2 = count2+1
		end
	end
end

function World:setDoorsAndWalls(room)
		local map = room.map
		local doors, walls = {}, {}
		for k, object in pairs(map.objects) do
		if object.name == 'South' or object.name == 'West' or object.name == 'North' or object.name == 'East' then
			doors[object.name] = {name = object.name, x = object.x, y = object.y, w = object.width, h = object.height, type = 'door', destination = object.properties.destination}
		else
			walls[object.name] = {name = object.name, x = object.x, y = object.y, w = object.width, h = object.height, type = 'wall', destination = nil}
		end
		end
		room.doors, room.walls = doors, walls
end

function setNPC(room, index)
	local npc = npc:getNpc(index)
	room.npc = npc
end

function setClue(room, index)
	local poster = poster:getPoster(index)
	room.clue = poster
end

function World:getRoom(name)
	return DATA[name]
end

function World:getPlayerSpawn(col)
	local x, y = 0, 0
	if col.name == 'South' then
		x, y = 16*7, 16*0.75
	elseif col.name == 'North' then
		x, y = 16*7, 16*12
	elseif col.name == 'West' then
		x, y = 16*13.5, 16*8
	elseif col.name == 'East' then
		x, y = 16*0.75, 16*8
	end
	return x, y
end

function getTableKeys(tab)
  local keyset = {}
  for k,v in pairs(tab) do
    keyset[#keyset + 1] = k
  end
  return keyset
end

function checkValues(table, value)
	for i = 1, #table do
		if table[i] == value then
			return true
		end
	end
	return false
end

function getRandomNum(numKeys)
	local nums = {}
	local rand
	while #nums < 5 do
		rand = love.math.random(3,numKeys)
		print(rand)
		if not checkValues(nums, rand) then
			nums[#nums+1] = rand
		end
	end
	return nums
end

return World