require('hud')
require('score')
require('audio')
require('target')
require('background')
require('crosshairs')

local timer = 0
local game_state = 1

function love.load()
    HUD:load()
    Score:load()
    Target:load()
    Crosshairs:load()
    Background:load()
    Audio:load()
end

function love.update(dt)
    Audio:update()

    if timer > 0 then
      timer = timer - dt
      HUD.timer = timer
    end

    if timer < 0 then
        timer = 0
        HUD.timer = timer
        Score.score = 0
        game_state = 1
    end
end

function love.draw()
    Background:draw()
    HUD:draw()

    if game_state == 1 then
        HUD:print_message('Click anywhere to begin!')
    else
        Target:draw()
    end

    Crosshairs:draw()
end

function love.mousepressed(x, y, button)
    if game_state == 1 then
        timer = 10
        HUD.timer = timer
        game_state = 2
        return
    end

    local distance = math.sqrt((x - Target.x)^2 + (y - Target.y)^2)
    local is_within_circle = distance < Target.radius or distance == Target.radius

    if is_within_circle then
        Score:add(button)
        Audio:play_target_hit()
        Target.x, Target.y = Target:get_rand_pos()

        if button == 2 then
            timer = timer - 1
            HUD.timer = timer
        end
    else
        if Score.score > 0 then
            Score:remove(1)
        end
    end
end
