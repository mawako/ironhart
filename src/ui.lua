require("lib/gooi")

function ui_load()
    help = gooi.newButton({
        text = "Help",
        x = 20,
        y = 20,
        w = 150,
        h = 35,
    }):onRelease(function()
        gooi.alert({
            text = "WASD to Move, LeftShift to Sprint"
        })
    end)
    :warning()

    stamina_bar = gooi.newBar({
        value = player.stamina,
        x = 0,
        y = 758,
        w = 1280,
        h = 10,
    })


end

function ui_update(dt)
    
    gooi.update(dt)
    stamina_bar.value = player.stamina 

end

function ui_draw()
    gooi.draw()
end

function love.mousepressed(x, y, button)  gooi.pressed() end
function love.mousereleased(x, y, button) gooi.released() end