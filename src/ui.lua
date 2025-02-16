require("lib/gooi")

function ui_load()
    btn = gooi.newButton({
        text = "Exit",
        x = 100,
        y = 100,
        w = 150,
        h = 35,
    }):onRelease(function()
        gooi.confirm({
            text = "Are you sure?",
            ok = function()
                love.event.quit()
            end
        })
    end)
    :warning()

end

function ui_update(dt)
    gooi.update(dt)
end

function ui_draw()
    gooi.draw()
end

function love.mousepressed(x, y, button)  gooi.pressed() end
function love.mousereleased(x, y, button) gooi.released() end