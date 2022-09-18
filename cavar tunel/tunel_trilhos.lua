rednet.open("right")

--qtdBlocos = 1

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
    qtdBlocos = {rednet.receive("teste")}
    local sender, message, protocol = rednet.receive("teste")
    if message == "dig" then
        for i = 1, qtdBlocos[2], 1 do
            digTunnel()
        end
    end
end
