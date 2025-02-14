function love.load()
	anim8 = require("lib/anim8")
	
	love.graphics.setDefaultFilter("nearest", "nearest")

	assets = {}
	assets.player = love.graphics.newImage("assets/gfx/player.png")
	assets.background = love.graphics.newImage("assets/gfx/background.png")
	assets.spritesheet = love.graphics.newImage("assets/gfx/spritesheet.png")

	player = {}
	player.x = 300
	player.y = 400
	player.speed = 200
	player.sprite = assets.player
	player.spritesheet = assets.spritesheet
	player.grid = anim8.newGrid(32, 32, player.spritesheet:getWidth(), player.spritesheet:getHeight())

	player.animations = {}
	player.animations.idle = anim8.newAnimation(player.grid("1-4", 1), 0.2)
	player.animations.up = anim8.newAnimation(player.grid("1-8", 3), 0.2)
	player.animations.down = anim8.newAnimation(player.grid("1-8", 5), 0.2)
	player.animations.left = anim8.newAnimation(player.grid("1-8", 4), 0.2)
	player.animations.right = anim8.newAnimation(player.grid("1-8", 2), 0.2)

	player.anim = player.animations.idle

end



function love.update(dt) 

	player.anim = player.animations.idle

	if love.keyboard.isDown("up", "w") then 
		player.y = player.y - (player.speed * dt)
		player.anim = player.animations.up
	end

	if love.keyboard.isDown("down", "s") then 
		player.y = player.y + (player.speed * dt)
		player.anim = player.animations.down
	end

	if love.keyboard.isDown("left", "a") then 
		player.x = player.x - (player.speed * dt)
		player.anim = player.animations.left
	end
	if love.keyboard.isDown("right", "d") then 
		player.x = player.x + (player.speed * dt)
		player.anim = player.animations.right
	end



	player.anim:update(dt)

end



function love.draw() 
	love.graphics.draw(assets.background,
		0, -- x position
		0, -- y position
		nil, -- angle, in radians
		2,2) -- scaling factor (original image scale times by number given) (x, y)

	player.anim:draw(player.spritesheet,
		player.x,
		player.y,
		nil,
		3,3)
end