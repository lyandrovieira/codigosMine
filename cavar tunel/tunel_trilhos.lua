rednet.open("right")

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
    if message == "ddig" then
        digTunnel()
    end
end