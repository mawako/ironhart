require("lib/gooi")

game_ui = {}

function game_ui.load()
    
    stamina_bar = gooi.newBar({
        value = player.stamina,
        x = 10,
        y = 40,
        w = 250,
        h = 20,
    })

    stamina_label = gooi.newLabel({
        text = "STAMINA",
        x = 10,
        y = 40,
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

    health_label = gooi.newLabel({
        text = "HEALTH",
        x = 10,
        y = 10,
        w = 250,
        h = 20
    })

end

function game_ui.update(dt)
    
    gooi.update(dt)
    stamina_bar.value = player.stamina
    stamina_bar.style.fgColor = {255/255, 255/255, 255/255, 1.0}
    stamina_bar.style.bgColor = {90/255, 197/255, 79/255, 1.0}
    stamina_label.style.fgColor = {19/255, 19/255, 19/255, 1.0}

    health_bar.value = player.health
    health_bar.style.fgColor = {255/255, 255/255, 255/255, 1.0}
    health_bar.style.bgColor = {255/255, 0, 64/255, 1.0}
    health_label.style.fgColor = {19/255, 19/255, 19/255, 1.0}

end

function game_ui.draw()
    gooi.draw()
end

function love.mousepressed(x, y, button)  gooi.pressed() end
function love.mousereleased(x, y, button) gooi.released() end