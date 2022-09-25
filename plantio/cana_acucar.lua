function colheita()
    turtle.dig()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.dig()
    turtle.turnRight()
end

function move()
    turtle.forward()
    turtle.turnRight()
end

turtle.turnLeft()

while true do
    colheita()

    if (turtle.detect()) then
        turtle.dropDown()
        sleep(600)
        turtle.turnLeft()
    else
        move()
    end    
end
