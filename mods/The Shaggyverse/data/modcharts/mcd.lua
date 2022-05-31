local window = 0
local a = 0
local start_Rock_Num = 2
local end_Rock_Num = 12
local tracer = 1
local rock_Stuff = {
    0
}
local CUR_SECTION = 0

function start (song)
    print("Song: " .. song .. " @ " .. bpm .. " downscroll: " .. downscroll)
    
    window = 240
end

function update(elapsed)
    CUR_SECTION = math.floor(curBeat / 4)
    a = a + (elapsed * 1.5)
    setActorPos(-5 + ((math.cos(a) * 2) * window), 200 + (math.sin(2 * a) * window), "dadCharacter0")
	setActorPos(-35 + ((math.cos(a + 1) * 2) * window), 200 + (math.sin(2 * (a + 1)) * window), "dadCharacter1")
	setActorPos(-55 + ((math.cos(a + 2) * 2) * window), 200 + (math.sin(2 * (a + 2)) * window), "dadCharacter2")
	setActorPos(-75 + ((math.cos(a + 3) * 2) * window), 200 + (math.sin(2 * (a + 3)) * window), "dadCharacter3")
end

print("Mod Chart script loaded :)")
