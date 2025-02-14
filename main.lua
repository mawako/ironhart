require "src/player"
require "src/assets"

function love.load()
	camera = require("lib/camera")
	anim8 = require("lib/anim8")
	sti = require("lib/sti")
	
	love.graphics.setDefaultFilter("nearest", "nearest")

	gameMap = sti("maps/map1.lua")

	load_assets()

	player_settings()

end

function love.keypressed(key, scancode, isrepeat)
   if key == "escape" then
      	love.event.quit()
   end

   if key == "a" or key == "left" then 
   		player.scaleX = -4
   end

   if key == "d" or key == "right" then 
   		player.scaleX = 4
   end

end

function love.update(dt) 

	player_movement(dt)

end

function love.draw()
	camera:attach()

		love.graphics.draw(assets.background,
			0, -- x position
			0, -- y position
			nil, -- angle, in radians
			2,2) -- scaling factor (original image scale times by number given) (x, y)

		gameMap:draw()

		player.anim:draw(player.spritesheet,
			player.x,
			player.y,
			nil,
			player.scaleX,
			player.scaleY,
			16, 16)
		
	camera:detach()
end