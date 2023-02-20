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

local function update_timer(value)
    timer = value
    HUD.timer = timer
end

function love.update(dt)
    Audio:update()
    if game_state == 2 then
        Target:update(dt)
    end

    if timer > 0 then
      update_timer(timer - dt)
    end

    if timer < 0 then
        update_timer(0)
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
        update_timer(10)
        game_state = 2
        return
    end

    if Target:is_mouse_within(x, y) then
        Score:add(button)
        Audio:play_target_hit()
        Target:reset()

        if button == 2 then
            update_timer(timer - 1)
        end
    else
        if Score.score > 0 then
            Score:remove(1)
        end
    end
end
