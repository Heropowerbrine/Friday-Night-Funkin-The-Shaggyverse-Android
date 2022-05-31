function update (elapsed) -- example https://twitter.com/KadeDeveloper/status/1382178179184422918
    a = a + (elapsed * 1.5)
    setActorPos(-400 + ((math.cos(a) * 2) * window), -2450 + (math.sin(2 * a) * window), "dadCharacter0")
    window = 240
end