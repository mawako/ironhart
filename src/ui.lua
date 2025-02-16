require("lib/gooi")

function ui_load()
    exit = gooi.newButton({
        text = "Exit",
        x = 20,
        y = 710,
        w = 150,
        h = 35,
    }):onRelease(function()
        gooi.confirm({
            text = "Are you sure?",
            ok = function()
                print("User pressed exit button")
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