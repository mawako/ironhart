require("lib/gooi")

ui_help = {}

function ui_help:load()
    return_to_menu = gooi.newButton({
        text = "BACK",
        x = 10,
        y = 10,
        w = 150,
        h = 35
    })
end

function ui_help:update(dt)
    gooi.update(dt)
end

function ui_help:draw()
    gooi.draw()
end

function love.mousepressed(x, y, button)  gooi.pressed() end
function love.mousereleased(x, y, button) gooi.released() end
