local poster = {}

local DATA = {
	['ghost'] = {
		name = 'Ghost',
		type = 'poster',
		sprite = love.graphics.newImage('assets/sprites/ghost_poster.png'),
		large = love.graphics.newImage('assets/sprites/ghost_poster-208x208.png'),
		x = 64,
		y = 32,
		w = 32,
		h = 24
	},
	['pumpkin-head'] = {
		name = 'Pumpkin Head',
		type = 'poster',
		sprite = love.graphics.newImage('assets/sprites/pumpkin-head_poster.png'),
		large = love.graphics.newImage('assets/sprites/pumpkin-head_poster-208x208.png'),
		x = 64,
		y = 32,
		w = 32,
		h = 24
	},
	['vampire'] = {
		name = 'Vampire',
		type = 'poster',
		sprite = love.graphics.newImage('assets/sprites/vampire_poster.png'),
		large = love.graphics.newImage('assets/sprites/vampire_poster-208x208.png'),
		x = 64,
		y = 32,
		w = 32,
		h = 24
	},
	['zombie'] = {
		name = 'Zombie',
		type = 'poster',
		sprite = love.graphics.newImage('assets/sprites/zombie_poster.png'),
		large = love.graphics.newImage('assets/sprites/zombie_poster-208x208.png'),
		x = 64,
		y = 32,
		w = 32,
		h = 24
	}
}

function poster:draw(poster)
	print(poster.x)
end

function poster:getPosterKeys()
	return getTableKeys(DATA)
end

function poster:getPoster(name)
	return DATA[name]
end

function getTableKeys(tab)
  local keyset = {}
  for k,v in pairs(tab) do
    keyset[#keyset + 1] = k
  end
  return keyset
end

return poster