require("src/player")
require("src/assets")
require("src/menu")
require("src/game")

function love.load()

	love.graphics.setDefaultFilter("nearest", "nearest")

	windfield = require("lib/windfield")
	hump_camera = require("lib/hump/camera")
	hump_gamestate = require("lib/hump/gamestate")
	anim8 = require("lib/anim8")
	sti = require("lib/sti")

	hump_gamestate.registerEvents()
	hump_gamestate.switch(game)

end

function love.update(dt) 
	
end

function love.draw()

end