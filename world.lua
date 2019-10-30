local sti = require 'lib/sti'
local bump = require 'lib/bump'

local World = {}

local DATA = {
  ['study'] = {
    map = sti('castle-halloween-party_study.lua', {'bump'}),
    doors = {}
  },
  ['hallway'] = {
    map = sti('castle-halloween-party_hallway.lua', {'bump'}),
    doors = {}
  }
}

function World:getRoom(name)
  return DATA[name]
end

function World:getDoors(m)
  local doors = {}
  for k, object in pairs(m.objects) do
    doors[object.name] = {name = object.name, x = object.x, y = object.y, w = object.width, h = object.height, destination = object.properties.destination}
  end
  return doors
end

return World