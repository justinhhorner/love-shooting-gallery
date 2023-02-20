Crosshairs = {}

function Crosshairs:load()
    self.x = 0
    self.y = 0
    self.img = love.graphics.newImage('sprites/crosshairs.png')
end

function Crosshairs:draw()
    love.graphics.draw(self.img,
        love.mouse.getX() - self.img:getWidth() / 2,
        love.mouse.getY() - self.img:getHeight() / 2)
end

