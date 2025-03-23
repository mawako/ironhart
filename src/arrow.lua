arrow = {}

function arrow.init()
    arrow.x = player.x
    arrow.y = player.y
    arrow.rotation = 0
    arrow.sprite = assets.gfx["arrow"]
    arrow.sprite:setFilter("nearest", "nearest")
    arrow.scale_x = 1
    arrow.scale_y = 1
    arrow.offset_x = assets.gfx["arrow"]:getWidth()/2
    arrow.offset_y = 24
end

function arrow.update(dt)
    arrow.x = player.x
    arrow.y = player.y

    local dx = love.mouse.getX() - arrow.x
    local dy = -(love.mouse.getY() - arrow.y)

    arrow.rotation = math.deg(math.atan2(dx, dy))
end

function arrow.draw()
    love.graphics.draw(arrow.sprite,
    arrow.x,
    arrow.y,
    arrow.rotation,
    arrow.scale_x,
    arrow.scale_y,
    arrow.offset_x,
    arrow.offset_y)
end