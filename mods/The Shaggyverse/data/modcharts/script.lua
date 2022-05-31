local turn = 10
local turn2 = 20
local y = 0;
local x = 0;
local canBob = true
local Strums = 'opponentStrums'
function onCreate()
    math.randomseed(os.clock() * 1000);
    
    --doTweenAlpha("gone","camHUD",0,0.01)
end
function onBeatHit()
    if curBeat == 1 then 
        y = defaultOpponentStrumY1;
        noteTweenAlpha("vanish0",0,0.5,crochet*0.004,"sineInOut")
        noteTweenAlpha("vanish1",1,0.5,crochet*0.0045,"sineInOut")
        noteTweenAlpha("vanish2",2,0.5,crochet*0.005,"sineInOut")
        noteTweenAlpha("vanish3",3,0.5,crochet*0.0055,"sineInOut")
        noteTweenAlpha("vanish4",4,0.5,crochet*0.0055,"sineInOut")
        noteTweenAlpha("vanish5",5,0.5,crochet*0.0055,"sineInOut")
        noteTweenAlpha("vanish6",6,0.5,crochet*0.0055,"sineInOut")
        noteTweenAlpha("vanish7",7,0.5,crochet*0.0055,"sineInOut")
        noteTweenAlpha("vanish8",8,0.5,crochet*0.0055,"sineInOut")
        noteTweenAlpha("vanish9",9,0.5,crochet*0.0055,"sineInOut")
    end
    if curBeat == 240 then
    turn = turn * 4
    end
    if curBeat % 2 == 0 and canBob then 
        turn2 = turn2 * -1
        for i = 0,19 do
            local uhhh = curBeat % 8 * (i + i)
            local swag = i % 4 * 2.5 - uhhh
            if i > 9 then
                x =  getPropertyFromGroup('opponentStrums', i-10, 'x');
            else
                x =  getPropertyFromGroup('playerStrums', i, 'x');
            end
            --noteTweenY("wheeeup"..i,i,y + turn,crochet*0.002,"sineInOut")
            noteTweenX("wheeeleft"..i,i,x + turn2,crochet*0.002,"sineInOut")
        end
    end
end 