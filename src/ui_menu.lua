require("lib/gooi")

ui_menu = {}

function ui_menu:load()
    
    play = gooi.newButton({
        text = "PLAY",
        x = 1120,
        y = 339,
        w = 150,
        h = 35,
    }):onRelease(function()
        gooi.confirm({
            text = "Begin game?",
            ok = function()
                hump_gamestate.switch(game)
                play.x, play.y = -1000, -1000
                help.x, help.y = -1000, -1000
                exit.x, exit.y = -1000, -1000
            end
        })
    end)

    help = gooi.newButton({
        text = "HELP",
        x = 1120,
        y = 384,
        w = 150,
        h = 35,
    }):onRelease(function()
        hump_gamestate.switch(help)
        play.x, play.y = -1000, -1000
        help.x, help.y = -1000, -1000
        exit.x, exit.y = -1000, -1000
    end)

    exit = gooi.newButton({
        text = "EXIT",
        x = 1120,
        y = 429,
        w = 150,
        h = 35
    }):onRelease(function() 
        gooi.confirm({
            text = "Are you sure you want to exit?",
            ok = function() 
                love.event.quit()
            end
        })
    end)
    
end

function ui_menu:update(dt)
    gooi.update(dt)
end

function ui_menu:draw()
    gooi.draw()
end

function love.mousepressed(x, y, button)  gooi.pressed() end
function love.mousereleased(x, y, button) gooi.released() end