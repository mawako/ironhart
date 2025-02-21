require("lib/gooi")

function menu_ui_load()
    
    play = gooi.newButton({
        text = "Play",
        x = 20,
        y = 700,
        w = 150,
        h = 35,
    }):onRelease(function()
        gooi.alert({
            text = "WASD to Move, " .. 
            "LShift to Sprint"
        })
    end)

end

function menu_ui_update(dt)
    gooi.update(dt)
end

function menu_ui_draw()
    gooi.draw()
end

function love.mousepressed(x, y, button)  gooi.pressed() end
function love.mousereleased(x, y, button) gooi.released() end