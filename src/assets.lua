function load_assets() 
	assets = {}
	assets.font = {}
	assets.gfx = {}

	assets.gfx.player = love.graphics.newImage("assets/gfx/player.png")
	assets.gfx.background = love.graphics.newImage("assets/gfx/background.png")
	assets.gfx.spritesheet = love.graphics.newImage("assets/gfx/spritesheet.png")

	assets.font.iosevka = love.graphics.newFont("assets/fonts/iosevka.ttf", 20)
end