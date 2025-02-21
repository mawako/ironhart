require("src/ui_game")

game = {}

function game:enter()
	gameMap = sti("maps/map1.lua")

	cam = hump_camera(100, 100, 4, 0)

	world = windfield.newWorld(0, 0)

	player_settings()

	walls = {}
	if gameMap.layers["colliders"] then 
		for i, obj in ipairs(gameMap.layers["colliders"].objects) do 
			local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
			wall:setType("static")
			table.insert(walls, wall)
		end
	end

	game_ui_load()
end

function game:update(dt)
	player_movement(dt)

	world:update(dt)
	player.x = player.collider:getX()
	player.y = player.collider:getY()

	cam:lookAt(player.x, player.y)

	game_ui_update(dt)
end

function game:keypressed(key)

   if key == "escape" then
      	gooi.confirm({
            text = "Return to menu?",
            ok = function()
                hump_gamestate.switch(menu)
                stamina_bar.x = -1000
                stamina_bar.y = -1000
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
		player.scaleX,
		player.scaleY,
		16, 16)

	gameMap:drawLayer(gameMap.layers["bottom_wall"])

	cam:detach()

	game_ui_draw()
end

return game