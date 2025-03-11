-- load assets
assets = {}

assets.gfx = {}
assets.gfx["background"] = love.graphics.newImage("assets/gfx/game_background.png")
assets.gfx["spritesheet"] = love.graphics.newImage("assets/gfx/spritesheet.png")
assets.gfx["logo"] = love.graphics.newImage("assets/gfx/logo.png")

assets.font = {}
assets.font["iosevka"] = love.graphics.newFont("assets/fonts/iosevka.ttf", 20)
assets.font["alagard"] = love.graphics.newFont("assets/fonts/alagard.ttf", 20)