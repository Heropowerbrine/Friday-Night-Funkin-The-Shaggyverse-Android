local window = 0
local a = 0
local waittimer = 0
local zoom = 1

function start (song)
end

function update (elapsed) -- example https://twitter.com/KadeDeveloper/status/1382178179184422918
		a = a + (elapsed * 1.5)
		setActorPos(1200 + ((math.cos(a) * 2) * window), 450 + (math.sin(-2 * a) * window), "bfCharacter4")
		window = 240
end
print("Mod Chart script loaded :)")