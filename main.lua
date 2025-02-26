require("src/player")
require("src/game")
require("lib/gooi")
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
            text = "Are you sure you want to exit?",
            ok = function()
                print("User quit game using ESC")
                love.event.quit()
            end
        	})
   end

end

function menu:draw()
	love.graphics.draw(assets.gfx["background"],
		0, -- x position
		0, -- y position
		nil, -- angle, in radians
		2,2) -- scaling factor (original image scale times by number given) (x, y) 

	love.graphics.draw(assets.gfx["logo"],
		330, -- x position
		384, -- y position
		nil, -- angle, in radians
		1,1, -- scaling factor (original image scale times by number given) (x, y)
		assets.gfx["background"]:getWidth()/2, -- offset x position
		assets.gfx["background"]:getHeight()/2) -- offset y position

	menu_ui_draw()
end


function love.load()

	-- set default filter for graphics
	love.graphics.setDefaultFilter("nearest", "nearest")

    -- load assets
	assets = {}
	assets.font = {}
	assets.gfx = {}

	assets.gfx["background"] = love.graphics.newImage("assets/gfx/background.png")
	assets.gfx["spritesheet"] = love.graphics.newImage("assets/gfx/spritesheet.png")
	assets.gfx["logo"] = love.graphics.newImage("assets/gfx/logo.png")

	assets.font["iosevka"] = love.graphics.newFont("assets/fonts/iosevka.ttf", 20)
	assets.font["alagard"] = love.graphics.newFont("assets/fonts/alagard.ttf", 20)

	-- load libraries
	windfield = require("lib/windfield")
	hump_camera = require("lib/hump/camera")
	hump_gamestate = require("lib/hump/gamestate")
	anim8 = require("lib/anim8")
	sti = require("lib/sti")
	bump = require("lib/bump")

	-- register hump gamestate events and set default to 'menu'
	hump_gamestate.registerEvents()
	hump_gamestate.switch(menu)

end
