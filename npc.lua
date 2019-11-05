local npc = {}

local DATA = {
	['ghost'] = {
		name = 'ghost',
		type = 'npc',
		sprite = love.graphics.newImage('assets/sprites/ghost.png'),
		x = 160,
		y = 80,
		w = 32,
		h = 32,
		inParty = false,
		isSafe = true,
		dialog = nil
	},
	['pumpkin-head'] = {
		name = 'pumpkin-head',
		type = 'npc',
		sprite = love.graphics.newImage('assets/sprites/pumpkin-head.png'),
		x = 160,
		y = 80,
		w = 32,
		h = 32,
		inParty = false,
		isSafe = true,
		dialog = nil
	},
	['vampire'] = {
		name = 'vampire',
		type = 'npc',
		sprite = love.graphics.newImage('assets/sprites/vampire.png'),
		x = 160,
		y = 80,
		w = 32,
		h = 32,
		inParty = false,
		isSafe = true,
		dialog = nil
	},
	['zombie'] = {
		name = 'zombie',
		type = 'npc',
		sprite = love.graphics.newImage('assets/sprites/zombie.png'),
		x = 160,
		y = 80,
		w = 32,
		h = 32,
		inParty = false,
		isSafe = true,
		dialog = nil
	}
}

function npc:getNpcKeys()
	return getTableKeys(DATA)
end

function npc:getNpc(name)
	return DATA[name]
end

function npc:setDialog()
end

function getTableKeys(tab)
  local keyset = {}
  for k,v in pairs(tab) do
    keyset[#keyset + 1] = k
  end
  return keyset
end

return npc