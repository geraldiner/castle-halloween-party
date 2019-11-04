local sti = require 'lib/sti'
local bump = require 'lib/bump'
local npc = require 'npc'

local World = {}

local DATA = {
  ['backyard'] = {
    map = sti('castle-halloween-party_backyard.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['bathroom'] = {
    map = sti('castle-halloween-party_bathroom.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['bedroom1'] = {
    map = sti('castle-halloween-party_bedroom1.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['bedroom2'] = {
    map = sti('castle-halloween-party_bedroom2.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['center-landing'] = {
    map = sti('castle-halloween-party_center-landing.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['den'] = {
    map = sti('castle-halloween-party_den.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['dining-room'] = {
    map = sti('castle-halloween-party_dining-room.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['family-room'] = {
    map = sti('castle-halloween-party_family-room.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['foyer'] = {
    map = sti('castle-halloween-party_foyer.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['hallway1'] = {
    map = sti('castle-halloween-party_hallway1.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['hallway2'] = {
    map = sti('castle-halloween-party_hallway2.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['hallway3'] = {
    map = sti('castle-halloween-party_hallway3.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['kitchen'] = {
    map = sti('castle-halloween-party_kitchen.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
  ['study'] = {
    map = sti('castle-halloween-party_study.lua', {'bump'}),
    doors = {},
	walls = {},
	npc = {}
  },
}

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

function World:getDoorsAndWalls(map)
  local doors, walls = {}, {}
  for k, object in pairs(map.objects) do
	if object.name == 'South' or object.name == 'West' or object.name == 'North' or object.name == 'East' then
		doors[object.name] = {name = object.name, x = object.x, y = object.y, w = object.width, h = object.height, type = 'door', destination = object.properties.destination}
	else
		walls[object.name] = {name = object.name, x = object.x, y = object.y, w = object.width, h = object.height, type = 'wall', destination = nil}
	end
  end
  return doors, walls
end

return World