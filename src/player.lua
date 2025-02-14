function player_settings() 
	player = {}
	player.x = 300
	player.y = 400
	player.scaleX = 4
	player.scaleY = 4
	player.speed = 200
	player.sprite = assets.player
	player.spritesheet = assets.spritesheet
	player.grid = anim8.newGrid(32, 32, player.spritesheet:getWidth(), player.spritesheet:getHeight())

	player.animations = {}
	player.animations.idle = anim8.newAnimation(player.grid("1-4", 1), 0.2)
	player.animations.up = anim8.newAnimation(player.grid("1-8", 3), 0.2)
	player.animations.down = anim8.newAnimation(player.grid("1-8", 5), 0.2)
	player.animations.left_right = anim8.newAnimation(player.grid("1-8", 2), 0.2)

	player.anim = player.animations.idle
end

function player_movement(dt) 
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
		player.anim = player.animations.left_right
	end
	
	if love.keyboard.isDown("right", "d") then 
		player.x = player.x + (player.speed * dt)
		player.anim = player.animations.left_right
	end

	player.anim:update(dt)
end
