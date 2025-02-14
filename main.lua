require "src/player"
require "src/assets"

function love.load()
	anim8 = require("lib/anim8")
	
	love.graphics.setDefaultFilter("nearest", "nearest")

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
	love.graphics.draw(assets.background,
		0, -- x position
		0, -- y position
		nil, -- angle, in radians
		2,2) -- scaling factor (original image scale times by number given) (x, y)

	player.anim:draw(player.spritesheet,
		player.x,
		player.y,
		nil,
		player.scaleX,
		player.scaleY,
		16, 16)
end