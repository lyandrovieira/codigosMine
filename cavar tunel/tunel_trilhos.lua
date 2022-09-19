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

function enviarStatus()
    rednet.send(1, "concluido", "status")
end

function defCave()
    blocos = { rednet.receive("qtdblocos") }
    local sender, message, protocol = rednet.receive("iniciar")
    if message == "dig" then
        --print("Cavando túnel com "..blocos[2].." blocos de comprimento")
        for i = 1, blocos[2], 1 do
            digTunnel()
        end
    end
end

while true do

    defCave()

    while true do
        enviarStatus()

        local sender, message, protocol = rednet.receive("menu")

        if message == "bloco" then
            defCave()
        end

        if message == "direcao" then

            turtle.back()

            local sender, message, protocol = rednet.receive("direcao")
            if message == "d" then
                turtle.turnRight()
            end
            if message == "e" then
                turtle.turnLeft()
            end

            turtle.forward()

            defCave()

        end

        if message == "break" then
            break
        end
    end
    break
end
