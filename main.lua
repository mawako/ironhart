
function love.load()
    love.graphics.setDefaultFilter("nearest")

    cursor = love.graphics.newImage("assets/gfx/cursor.png")
    love.mouse.setVisible(false)

    player = {
        x = 200,
        y = 300,
        speed = 200,
        size = 10
    }

    fonts = {
        Gohu11 = love.graphics.newFont("assets/fonts/Gohu11.ttf", 20),
        JBMono = love.graphics.newFont("assets/fonts/JBMono.ttf", 20)
    }

    properties = {
        hRes = 0,
        vRes = 0,
        cursor_size = 1,
        current_font = fonts.Gohu11,
    }

end

function love.keypressed(key, scancode, isrepeat)

   -- quit
   if key == "escape" then
      love.event.quit()
   end

   -- change cursor size
   if key == "kp1" then 
        properties.cursor_size = 1
    elseif key == "kp2" then
        properties.cursor_size = 2
   end

   -- change font
   if key == "kp4" then 
        properties.current_font = fonts.Gohu11
    elseif key == "kp5" then
        properties.current_font = fonts.JBMono
   end
end

function love.update(dt) 
    properties.hRes = love.graphics.getWidth()
    properties.vRes = love.graphics.getHeight()

    if love.keyboard.isDown("right") then
      player.x = player.x + (player.speed * dt)
    elseif love.keyboard.isDown("left") then
      player.x = player.x - (player.speed * dt)
    end
    if love.keyboard.isDown("down") then
      player.y = player.y + (player.speed * dt)
    elseif love.keyboard.isDown("up") then
      player.y = player.y - (player.speed * dt)
    end

    if player.x > properties.hRes then 
        player.x = properties.hRes
    elseif player.y > properties.vRes then
        player.y = properties.vRes
    elseif player.x < 0 then
        player.x = 0
    elseif player.y < 0 then
        player.y = 0
    end

end

function love.draw() 

    love.graphics.circle("fill", 
        player.x, 
        player.y, 
        player.size)
    
    love.graphics.print(
        "Screen Resolution: " .. properties.hRes .. "x" .. properties.vRes,
        properties.current_font, 
        10, 
        10)

    love.graphics.print("Player X: " .. math.floor(player.x) .. " Y: " .. math.floor(player.y),
        properties.current_font,
        10,
        30)

    love.graphics.print(
        "Cursor size: " .. properties.cursor_size,
        properties.current_font, 
        10, 
        50)

    love.graphics.print(
        "FPS: " .. tostring(love.timer.getFPS()),
        properties.current_font, 
        10, 
        70)

    -- cursor (keep at bottom)
    love.graphics.draw(cursor, 
        (love.mouse.getX() + 16) - cursor:getWidth() / 2, 
        (love.mouse.getY() + 16) - cursor:getHeight() / 2,
        0,
        properties.cursor_size, properties.cursor_size)

end