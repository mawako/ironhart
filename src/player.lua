require("src/assets")
anim8 = require("lib/anim8")

player = {}

function player.init()
	player.x = 100
	player.y = 150
	player.scale_x = 1
	player.scale_y = 1
	player.speed = 75
	player.speed_modfier = 1
	player.stamina = 1
	player.health = 1
	player.spritesheet = assets.gfx["spritesheet"]
	player.spritesheet:setFilter("nearest", "nearest")
	player.grid = anim8.newGrid(32, 32, player.spritesheet:getWidth(), player.spritesheet:getHeight())
	player.collider = world:newBSGRectangleCollider(player.x, player.y, 12, 16, 10)
	player.collider:setFixedRotation(true)
	player.collider:setCollisionClass("Player")
	--
	player.animations = {}
	player.animations["idle"] = anim8.newAnimation(player.grid("1-4", 1), 0.3)
	player.animations["up"] = anim8.newAnimation(player.grid("1-8", 3), 0.1)
	player.animations["down"] = anim8.newAnimation(player.grid("1-8", 5), 0.1)
	player.animations["left"] = anim8.newAnimation(player.grid("1-8", 4), 0.1)
	player.animations["right"] = anim8.newAnimation(player.grid("1-8", 2), 0.1)
	player.animations["attack"] = anim8.newAnimation(player.grid("1-6", 17), 0.1)

	player.anim = player.animations.idle
end

function player.collision_check()
	player.x = player.collider:getX()
	player.y = player.collider:getY()
end


function player.movement(dt)

	local velocity_x = 0
	local velocity_y = 0

	player.anim = player.animations["idle"]

	if love.keyboard.isDown("w") then 
		velocity_y = (player.speed * player.speed_modfier) * -1
		player.anim = player.animations["up"]
	end

	if love.keyboard.isDown("s") then
		velocity_y = player.speed * player.speed_modfier
		player.anim = player.animations["down"]
	end

	if love.keyboard.isDown("a") then
		velocity_x = (player.speed * player.speed_modfier) * -1
		player.anim = player.animations["left"]
	end

	if love.keyboard.isDown("d") then
		velocity_x = player.speed * player.speed_modfier
		player.anim = player.animations["right"]
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

	-- check if player.stamina is not less than 0 or more than 1
	if player.stamina > 1 then 
		player.stamina = 1
	elseif player.stamina < 0 then
		player.stamina = 0
		player.speed_modfier = 1
	end

	if player.health > 1 then
		player.health = 1
	elseif player.health < 0 then
		player.health = 0
		love.event.quit()
	end

	-- slow regeneration
	if player.health ~= 1 then
		player.health = player.health + 0.00005
	end

	player.collider:setLinearVelocity(velocity_x, velocity_y)

	player.anim:update(dt)
end


