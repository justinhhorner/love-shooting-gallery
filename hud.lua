HUD = {}

function HUD:load()
   self.timer = 0
   self.margin = 20
   self.small_font = love.graphics.newFont(24)
   self.large_font = love.graphics.newFont(40)
end

function HUD:draw()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(self.small_font)
    love.graphics.print('Score: '..Score.score, self.margin, self.margin)
    love.graphics.print('Time: '..math.ceil(self.timer), love.graphics.getWidth() - 110 - self.margin, self.margin)
    love.graphics.setColor(1, 1, 1)
end

function HUD:print_message(text)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(self.large_font)
    love.graphics.printf(text, 0, 85, love.graphics.getWidth(), 'center')
    love.graphics.setColor(1, 1, 1)
end
