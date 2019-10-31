local sti = require 'lib/sti'
local bump = require 'lib/bump'

local World = {}

local DATA = {
  ['backyard'] = {
    map = sti('castle-halloween-party_backyard.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['bathroom'] = {
    map = sti('castle-halloween-party_bathroom.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['bedroom1'] = {
    map = sti('castle-halloween-party_bedroom1.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['bedroom2'] = {
    map = sti('castle-halloween-party_bedroom2.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['center-landing'] = {
    map = sti('castle-halloween-party_center-landing.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['den'] = {
    map = sti('castle-halloween-party_den.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['dining-room'] = {
    map = sti('castle-halloween-party_dining-room.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['family-room'] = {
    map = sti('castle-halloween-party_family-room.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['foyer'] = {
    map = sti('castle-halloween-party_foyer.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['hallway1'] = {
    map = sti('castle-halloween-party_hallway1.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['hallway2'] = {
    map = sti('castle-halloween-party_hallway2.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['hallway3'] = {
    map = sti('castle-halloween-party_hallway3.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['kitchen'] = {
    map = sti('castle-halloween-party_kitchen.lua', {'bump'}),
    doors = {},
	walls = {}
  },
  ['study'] = {
    map = sti('castle-halloween-party_study.lua', {'bump'}),
    doors = {},
	walls = {}
  },
}

function World:getRoom(name)
  return DATA[name]
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