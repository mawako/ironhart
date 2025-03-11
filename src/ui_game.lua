require("lib/gooi")

function game_ui_load()
    
    stamina_bar = gooi.newBar({
        value = player.stamina,
        x = 10,
        y = 10,
        w = 250,
        h = 30,
    })

end

function game_ui_update(dt)
    
    gooi.update(dt)
    stamina_bar.value = player.stamina

end

function game_ui_draw()
    gooi.draw()
end

function love.mousepressed(x, y, button)  gooi.pressed() end
function love.mousereleased(x, y, button) gooi.released() end