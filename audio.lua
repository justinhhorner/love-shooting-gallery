Audio = {}

function Audio:load()
    self.music = love.audio.newSource('audio/game_loop.wav', 'stream')
    self.hit_sfx = {
       love.audio.newSource('audio/hit_01.ogg', 'static'),
       love.audio.newSource('audio/hit_02.ogg', 'static'),
       love.audio.newSource('audio/hit_03.ogg', 'static')
    }

    self.music:setVolume(0.5)
    love.audio.play(self.music)
end

function Audio:update()
    if not self.music:isPlaying() then
        love.audio.play(self.music)
    end
end

function Audio:play_target_hit()
    love.audio.play(self.hit_sfx[math.random(1, 3)])
end
