Score = {}

function Score:load()
   self.score = 0
end

function Score:add(amount)
    amount = amount or 1
    self.score = self.score + amount
end

function Score:remove(amount)
    amount = amount or 1
    if self.score > 0 then
        self.score = self.score - amount
    end
end
