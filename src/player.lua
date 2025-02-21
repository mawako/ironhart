
function player_settings() 
	player = {}
	player.x = 100
	player.y = 150
	player.scaleX = 1
	player.scaleY = 1
	player.speed = 75
	player.speed_modfier = 1
	player.stamina = 1
	player.sprite = assets.gfx["player"]
	player.spritesheet = assets.gfx["spritesheet"]
	player.grid = anim8.newGrid(32, 32, player.spritesheet:getWidth(), player.spritesheet:getHeight())
	player.collider = world:newBSGRectangleCollider(player.x, player.y, 12, 16, 10)
	player.collider:setFixedRotation(true)

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
		velocity_y = (player.speed * player.speed_modfier) * -1
		player.anim = player.animations["up"]
	elseif love.keyboard.isDown("s") then 
		velocity_y = player.speed * player.speed_modfier
		player.anim = player.animations["down"]
	end

	if love.keyboard.isDown("a") then 
		velocity_x = (player.speed * player.speed_modfier) * -1
		player.anim = player.animations["left_right"]
		player.scaleX = -1
	elseif love.keyboard.isDown("d") then 
		velocity_x = player.speed * player.speed_modfier
		player.anim = player.animations["left_right"]
		player.scaleX = 1
	end

	if love.keyboard.isDown("lshift") and velocity_x ~= 0 then 
		player.speed_modfier = 1.75
		player.stamina = player.stamina - 0.001
	elseif love.keyboard.isDown("lshift") and velocity_y ~= 0 then
    player.speed_modfier = 1.75
		player.stamina = player.stamina - 0.001
  else 
		player.speed_modfier = 1
		player.stamina = player.stamina + 0.001
	end

	if player.stamina > 1 then 
		player.stamina = 1
	elseif player.stamina < 0 then
		player.stamina = 0
		player.speed_modfier = 1
	end

	player.collider:setLinearVelocity(velocity_x, velocity_y)

	player.anim:update(dt)
end

