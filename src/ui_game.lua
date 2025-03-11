require("lib/gooi")

function game_ui_load()
    
    stamina_bar = gooi.newBar({
        value = player.stamina,
        x = 10,
        y = 45,
        w = 250,
        h = 20,
    })

    stamina_counter = gooi.newLabel({
        text = "STAMINA",
        x = 10,
        y = 45,
        w = 250,
        h = 20
    })

    health_bar = gooi.newBar({
        value = player.health,
        x = 10,
        y = 10,
        w = 250,
        h = 20
    })

end

function game_ui_update(dt)
    
    gooi.update(dt)
    stamina_bar.value = player.stamina
    health_bar.value = player.health

    stamina_counter.style.fgColor = {19/255, 19/255, 19/255, 1.0}

end

function game_ui_draw()
    gooi.draw()
end

function love.mousepressed(x, y, button)  gooi.pressed() end
function love.mousereleased(x, y, button) gooi.released() end