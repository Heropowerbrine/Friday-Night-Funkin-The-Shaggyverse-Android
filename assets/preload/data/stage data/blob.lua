local randomTime = 0
local yes = false

function create(stage)
    randomTime = math.random(1,10)
end

function update(elapsed)
    if songPos / 100 >= randomTime and yes == false then
        setActorVelocityX(1000, blob)
        yes = true
    end
end