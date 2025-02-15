require "src/player"
require "src/assets"

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")

	windfield = require("lib/windfield")
	world = windfield.newWorld(0, 0)

	camera = require("lib/camera")
	anim8 = require("lib/anim8")
	sti = require("lib/sti")

	gameMap = sti("maps/map1.lua")

	cam = camera(100, 100, 4, 0)

	load_assets()

	player_settings()

end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      	love.event.quit()
   end

   if key == "a" or key == "left" then 
   		player.scaleX = -1
   end

   if key == "d" or key == "right" then 
   		player.scaleX = 1
   end

end

function love.update(dt) 

	player_movement(dt)

	cam:lookAt(player.x, player.y)

end

function love.draw()
	cam:attach()
		love.graphics.draw(assets.gfx.background,
			player.x, -- x position
			player.y, -- y position
			nil, -- angle, in radians
			0.5,0.5, -- scaling factor (original image scale times by number given) (x, y)
			assets.gfx.background:getWidth()/2, -- 
			assets.gfx.background:getHeight()/2) 

		gameMap:drawLayer(gameMap.layers["Ground"])
		gameMap:drawLayer(gameMap.layers["Objects"])
		gameMap:drawLayer(gameMap.layers["Wall"])

		player.anim:draw(player.spritesheet,
			player.x,
			player.y,
			nil,
			player.scaleX,
			player.scaleY,
			16, 16)
	cam:detach()

	love.graphics.print("X: " .. math.floor(player.x) .. " Y: " .. math.floor(player.y),
			assets.font.iosevka,
			10,10)
end