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
		sprite = love.graphics.newImage('assets/sprites/zombie.png'),
		x = x,
		y = y,
		w = w,
		h = h,
		inParty = inParty,
		isSafe = true,
	}
	
}

function getNPC(name)
	return DATA[name]
end

function npc:setDialog()
end

return npc