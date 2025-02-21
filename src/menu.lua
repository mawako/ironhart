require("src/ui_menu")

menu = {}

function menu:enter() 
	menu_ui_load()
end

function menu:update(dt) 
	menu_ui_update(dt)
end

function menu:keypressed(key)

   if key == "escape" then
      	gooi.confirm({
            text = "Exit game?",
            ok = function()
                print("User pressed exit button")
                love.event.quit()
            end
        	})
   end

end

function menu:draw()
	love.graphics.draw(assets.gfx["background"],
		player.x, -- x position
		player.y, -- y position
		nil, -- angle, in radians
		2,2, -- scaling factor (original image scale times by number given) (x, y)
		assets.gfx.background:getWidth()/2, -- 
		assets.gfx.background:getHeight()/2) 

	love.graphics.print("HELLO WORLD!",
		100,
		100)

	menu_ui_draw()
end

return menu