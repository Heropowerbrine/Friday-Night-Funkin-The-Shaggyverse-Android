local window = 0
local a = 0
local waittimer = 0
local zoom = 1

function start (song)
end

function update (elapsed) -- example https://twitter.com/KadeDeveloper/status/1382178179184422918
	local currentBeat = (songPos / 1000) * (bpm / 60)

	if currentBeat >= 10 and currentBeat < 14 then
		zoom = zoom + (((elapsed * 10) * 2) * 3)
		setActorPos((-125 * zoom + 500)/zoom,(-200 * zoom + -2500)/zoom,"dad")
		window = 10
	end

	if currentBeat >= 14 then
		a = a + (elapsed * 1.5)
		setActorPos(-125 + ((math.cos(a) * 2) * window), -200 + (math.sin(2 * a) * window), "dad")
	end
	
	if currentBeat >= 80 then
		window = 240
	end
end
print("Mod Chart script loaded :)")