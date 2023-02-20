Target = {}

function Target:load()
    self.x = 300
    self.y = 300
    self.radius = 50
    self.img = love.graphics.newImage('sprites/target.png')

    love.mouse.setVisible(false)
    love.mouse.setPosition(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
end

function Target:draw()
    love.graphics.draw(Target.img, self.x - self.radius, self.y - self.radius)
end

function Target:get_rand_pos()
    local pos_x = math.random(self.radius, love.graphics.getWidth() - self.radius)
    local pos_y = math.random(self.radius, love.graphics.getHeight() - self.radius)
    return pos_x, pos_y
end
