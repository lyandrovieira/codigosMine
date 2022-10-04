local numLinhas = 5
local indiceColuna = 0
local distBlocos = 5
local slotCount = 16
local isBlock, data, isCobble, data1, itemDrop

function moveBlocks()

    for i = 1, distBlocos, 1 do
        turtle.forward()
    end

end

function moveLine()

    for i = 1, numLinhas - 1, 1 do
        moveBlocks()
        swapDirection()
        colectOxidizedCopper()
    end

end

function swapDirection()

    if (indiceColuna % 2 == 0) then
        turtle.turnLeft()
    else
        turtle.turnRight()
    end

end

function invertedSwapDirection()

    if (indiceColuna % 2 == 0) then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end

end

function getItemIndex(itemName)

    for slot = 1, slotCount, 1 do
        local item = turtle.getItemDetail(slot)
        if (item ~= nil) then
            if (item["name"] == itemName) then
                return slot
            end
        end
    end

end

function placeCopperBlock()

    copperBlockIndex = getItemIndex("minecraft:copper_block")
    turtle.select(copperBlockIndex)
    turtle.place()

end

function colectOxidizedCopper()

    isBlock, data = turtle.inspect()

    if (isBlock) then
        if (indiceColuna % 2 == 0) then
            if (data.name == "minecraft:oxidized_copper") then
                turtle.dig()
                placeCopperBlock()
                turtle.turnRight()
            else
                turtle.turnRight()
            end
        else
            if (data.name == "minecraft:oxidized_copper") then
                turtle.dig()
                placeCopperBlock()
                turtle.turnLeft()
            else
                turtle.turnLeft()
            end
        end
    end

end

invertedSwapDirection()

while true do

    invertedSwapDirection()
    turtle.forward()
    swapDirection()
    colectOxidizedCopper()

    moveLine()
    turtle.forward()

    isCobble, data1 = turtle.inspect()

    if (isCobble) then

        if (data1.name == "minecraft:cobblestone") then

            invertedSwapDirection()
            for i = 1, 15, 1 do
                turtle.forward()
            end

            swapDirection()
            itemDrop = getItemIndex("minecraft:oxidized_copper")
            turtle.select(itemDrop)
            turtle.drop()
            swapDirection()
            indiceColuna = 0
            sleep(600)

        end

    else

        swapDirection()
        moveBlocks()

        indiceColuna = indiceColuna + 1

    end

end
