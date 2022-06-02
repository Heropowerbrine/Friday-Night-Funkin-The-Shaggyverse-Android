function start()
    strumLine1Visible = false
end
function playerTwoSing(data, time, type)
    if getHealth() - 0.0075 > 0 then
        setHealth(getHealth() - 0.0075)
    else
        setHealth(0.0075)
    end
end