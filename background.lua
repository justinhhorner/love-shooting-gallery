Background = {}

function Background:load()
    self.scale_factor = 2.5
    self.imgs = {}

    for i = 1, 6  do
       self.imgs[i] = love.graphics.newImage('sprites/hills_layer_0'..i..'.png')
    end

end

function Background:draw()
    for i = 1, #self['imgs'] do
        love.graphics.draw(self['imgs'][i], 0, 0, 0, self.scale_factor, self.scale_factor)
    end
end
