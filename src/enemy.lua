enemy = {}

function enemy.initalise()
    enemy.x = 100
    enemy.y = 100
    enemy.scale_x = 1
    enemy.scale_y = 1
    enemy.speed = 35
    enemy.health = 1
    enemy.sprite = assets.gfx["enemy_sprite"]
    enemy.sprite:setFilter("nearest", "nearest")
    enemy.collider = world:newBSGRectangleCollider(enemy.x, enemy.y, 12, 16, 10)
    enemy.collider:setFixedRotation(true)
end

function enemy.collision_check()
    enemy.x = enemy.collider:getX()
    enemy.y = enemy.collider:getY()
end

function enemy.movement(dt)

    local velocity_x = 0
    local velocity_y = 0

    if enemy.x < player.x then
        velocity_x = enemy.speed
    elseif enemy.x > player.x then
        velocity_x = enemy.speed * -1
    end

    if enemy.y < player.y then
        velocity_y = enemy.speed
    elseif enemy.y > player.y then
        velocity_y = enemy.speed * -1
    end

    enemy.collider:setLinearVelocity(velocity_x, velocity_y)
end
