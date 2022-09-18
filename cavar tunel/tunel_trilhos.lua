rednet.open("right")

qtdBlocos = 5

function dig()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
end

function moveToSides()
    turtle.turnRight()
    dig()
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.forward()
    dig()
end

function returnToCenter()
    turtle.turnRight()
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
end

function digTunnel()
    dig()
    moveToSides()
    returnToCenter()
end

while true do
    local sender, message, protocol = rednet.receive()
    if message == "dig" then
        for count = 1, qtdBlocos, 1 do
            digTunnel()
        end
    end
end