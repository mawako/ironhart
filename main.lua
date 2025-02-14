function love.load()
	anim8 = require("lib/anim8")
	vudu = require("lib/vudu")

	vudu.initialize()
	love.graphics.setDefaultFilter("nearest")

	assets = {}
	assets.player = love.graphics.newImage("assets/gfx/player.png")

	player = {}
	player.x = 300
	player.y = 400
	player.speed = 200
	player.sprite = assets.player
end

function love.update(dt) 
	if love.keyboard.isDown("up", "w") then 
		player.y = player.y - (player.speed * dt)
	end

	if love.keyboard.isDown("down", "s") then 
		player.y = player.y + (player.speed * dt)
	end

	if love.keyboard.isDown("left", "a") then 
		player.x = player.x - (player.speed * dt)
	end

	if love.keyboard.isDown("right", "d") then 
		player.x = player.x + (player.speed * dt)
	end
end

function love.draw() 
	love.graphics.draw(player.sprite, 
		player.x, 
		player.y, 
		0, -- angle (in radian)
		3, 3, -- scale factor (x , y)
		player.sprite:getWidth()/2, 
		player.sprite:getHeight()/2)
end