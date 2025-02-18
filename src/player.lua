
function player_settings() 
	player = {}
	player.collider = world:newBSGRectangleCollider(200, 270, 12, 16, 10)
	player.collider:setFixedRotation(true)
	player.x = 200
	player.y = 260
	player.scaleX = 1
	player.scaleY = 1
	player.speed = 10000
	player.sprite = assets.gfx.player
	player.spritesheet = assets.gfx.spritesheet
	player.grid = anim8.newGrid(32, 32, player.spritesheet:getWidth(), player.spritesheet:getHeight())

	player.animations = {}
	player.animations["idle"] = anim8.newAnimation(player.grid("1-4", 1), 0.3)
	player.animations["up"] = anim8.newAnimation(player.grid("1-8", 3), 0.1)
	player.animations["down"] = anim8.newAnimation(player.grid("1-8", 5), 0.1)
	player.animations["left_right"] = anim8.newAnimation(player.grid("1-8", 2), 0.1)
	player.animations["attack"] = anim8.newAnimation(player.grid("1-6", 17), 0.1)

	player.anim = player.animations.idle
end

function player_movement(dt)
	local velocity_x = 0
	local velocity_y = 0

	player.anim = player.animations["idle"]

	if love.keyboard.isDown("w") then 
		velocity_y = (player.speed * dt) * -1
		player.anim = player.animations["up"]
	elseif love.keyboard.isDown("s") then 
		velocity_y = (player.speed * dt)
		player.anim = player.animations["down"]
	end

	if love.keyboard.isDown("a") then 
		velocity_x = (player.speed * dt) * -1
		player.anim = player.animations["left_right"]
		player.scaleX = -1
	elseif love.keyboard.isDown("d") then 
		velocity_x = (player.speed * dt)
		player.anim = player.animations["left_right"]
		player.scaleX = 1
	end

	if love.keyboard.isDown("lshift") then 
		player.speed = 15000
	else 
		player.speed = 10000
	end

	player.collider:setLinearVelocity(velocity_x, velocity_y)

	player.anim:update(dt)
end

