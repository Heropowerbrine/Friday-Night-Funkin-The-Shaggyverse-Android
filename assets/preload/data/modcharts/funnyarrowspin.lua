local time_to_wait = 104.41
function update(elapsed)
if songPos / 1000 > time_to_wait then
    if curStep > 0 then
        local currentBeat = (songPos / 1000) * (bpm / 60)
        
        for i=0,(keyCount * 4) - 1 do
            setActorX(_G['defaultStrum'..i..'X'] + 22 * math.sin((currentBeat + i*0.25) * math.pi), i)
            setActorY(_G['defaultStrum'..i..'Y'] + 22 * math.cos((currentBeat + i*0.25) * math.pi), i)
        end
    end
end
end
