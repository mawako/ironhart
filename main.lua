require("src/player")
require("src/assets")
require("src/ui")

function love.load()

	love.graphics.setDefaultFilter("nearest", "nearest")

	windfield = require("lib/windfield")
	hump_camera = require("lib/hump/camera")
	hump_gamestate = require("lib/hump/gamestate")
	anim8 = require("lib/anim8")
	sti = require("lib/sti")

	gameMap = sti("maps/map1.lua")

	cam = hump_camera(100, 100, 4, 0)

	world = windfield.newWorld(0, 0)

	load_assets()

	player_settings()

	walls = {}
	if gameMap.layers["colliders"] then 
		for i, obj in ipairs(gameMap.layers["colliders"].objects) do 
			local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
			wall:setType("static")
			table.insert(walls, wall)
		end
	end

	ui_load()

end

function love.keypressed(key, scancode, isrepeat)

   if key == "escape" then
      	gooi.confirm({
            text = "Are you sure?",
            ok = function()
                print("User pressed exit button")
                love.event.quit()
            end
        	})
   end

end

function love.update(dt) 

	player_movement(dt)

	world:update(dt)
	player.x = player.collider:getX()
	player.y = player.collider:getY()

	cam:lookAt(player.x, player.y)

	ui_update(dt)


end

function love.draw()

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

	love.graphics.print("X: " .. math.floor(player.x) .. " Y: " .. math.floor(player.y),
			assets.font.iosevka,
			10,10)

	ui_draw()
end