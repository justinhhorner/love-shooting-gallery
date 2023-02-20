Target = {}

local function get_rand_pos()
    local pos_x = math.random(Target.radius, love.graphics.getWidth() - Target.radius)
    local pos_y = math.random(Target.radius, love.graphics.getHeight() - Target.radius)
    return pos_x, pos_y
end

function Target:load()
    self.x = 300
    self.y = 300
    self.radius = 50
    self.scale_factor = 1
    self.reset_timer = 0.5
    self.scale_speed = 0.2
    self.img = love.graphics.newImage('sprites/target.png')

    love.mouse.setVisible(false)
    love.mouse.setPosition(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
end

function Target:update(dt)
    if self.reset_timer > 0 then
        self.reset_timer = self.reset_timer - dt
    end

    if self.reset_timer < 0 then
        self.scale_factor = self.scale_factor - self.scale_speed * dt
        if self.scale_factor < 0 then
           self:reset()
        end
    end
end

function Target:draw()
    love.graphics.draw(Target.img,
        self.x - self.radius,
        self.y - self.radius,
        0,
        self.scale_factor,
        self.scale_factor)
end

function Target:reset()
    self.x, self.y = get_rand_pos()
    self.scale_factor = 1
    self.reset_timer = 0.5
end

function Target:is_mouse_within(x, y)
    local distance = math.sqrt((x - Target.x)^2 + (y - Target.y)^2)
    return distance < Target.radius or distance == Target.radius
end
