rednet.open("back")

while true do
    local event, character = os.pullEvent("char")
    if character == "d" then
        rednet.broadcast("ddig")
    end
end
