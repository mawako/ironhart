require("src/ui_game")

game = {}

function game:enter()
	gameMap = sti("maps/map1.lua")

	-- declare camera properties
	cam = hump_camera(100, 100, 4, 0)

	-- initialise the world colliders using the Windfield library
	world = windfield.newWorld(0, 0)
	-- add collision classes for specific uses
	world:addCollisionClass("Walls")
	world:addCollisionClass("Player")
	world:addCollisionClass("Powerup")
	world:addCollisionClass("Enemy")

	player.init()
	enemy.init()
	arrow.init()

	walls = {}
	if gameMap.layers["colliders"] then 
		for i, obj in ipairs(gameMap.layers["colliders"].objects) do 
			local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
			wall:setType("static")
			table.insert(walls, wall)
		end
	end

	game_ui.load()
end

function game:update(dt)

	player.movement(dt)
	enemy.movement(dt)

	arrow.update(dt)

	world:update(dt)
	player.collision_check()
	enemy.collision_check()

	cam:lookAt(player.x, player.y)

	game_ui.update(dt)
end

function game:keypressed(key)

   if key == "escape" then
      	gooi.confirm({
            text = "Return to menu?",
            ok = function()
                hump_gamestate.switch(menu)
                stamina_bar.x = -1000
				stamina_label.x = -1000
				health_bar.x = -1000
            end
        	})
   end

end

function game:draw()
	cam:attach()

	love.graphics.draw(assets.gfx["background"],
		player.x, -- x position
		player.y, -- y position
		nil, -- angle, in radians
		0.5,0.5, -- scaling factor (original image scale times by number given) (x, y)
		assets.gfx.background:getWidth()/2, -- 
		assets.gfx.background:getHeight()/2) 

		gameMap:drawLayer(gameMap.layers["ground"])
		gameMap:drawLayer(gameMap.layers["wall"])

	player.anim:draw(player.spritesheet,
		player.x,
		player.y,
		nil,
		player.scale_x,
		player.scale_y,
		16, 16)

	love.graphics.draw(enemy.sprite,
		enemy.x, enemy.y,
		nil,
		enemy.scale_x, enemy.scale_y,
		assets.gfx["enemy_sprite"]:getWidth()/2,
		assets.gfx["enemy_sprite"]:getHeight()/2)

	gameMap:drawLayer(gameMap.layers["bottom_wall"])

	arrow:draw()

	cam:detach()

	game_ui.draw()
end

return game