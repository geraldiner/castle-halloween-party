local npc = {
	sprite = nil,
	x = 160,
	y = 80,
	w = 32,
	h = 32,
	inParty = false,
	isSafe = nil,
	dialog = nil
}

local DATA = {
	['ghost'] = {
		name = 'ghost',
		type = 'npc',
		sprite = love.graphics.newImage('assets/sprites/ghost.png'),
		x = x,
		y = y,
		w = w,
		h = h,
		inParty = inParty,
		isSafe = true,
	},
	['pumpkin-head'] = {
		name = 'pumpkin-head',
		type = 'npc',
		sprite = love.graphics.newImage('assets/sprites/pumpkin-head.png'),
		x = x,
		y = y,
		w = w,
		h = h,
		inParty = inParty,
		isSafe = false,
	},
	['vampire'] = {
		name = 'vampire',
		type = 'npc',
		sprite = love.graphics.newImage('assets/sprites/vampire.png'),
		x = x,
		y = y,
		w = w,
		h = h,
		inParty = inParty,
		isSafe = true,
	},
	['zombie'] = {
		name = 'zombie',
		type = 'npc',
		sprite = love.graphics.newImage('assets/sprites/zombie.png'),
		x = x,
		y = y,
		w = w,
		h = h,
		inParty = inParty,
		isSafe = true,
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