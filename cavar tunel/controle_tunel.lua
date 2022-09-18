rednet.open("back")

while true do
    print("Digite o tamanho do túnel: ")
    blocos = print(read())
    rednet.send(0, blocos, "teste")

    print("Pressione a tecla 'i' para iniciar a escavação.")
    local event, character = os.pullEvent("char")
    if character == "i" then
        rednet.send(0, "dig", "teste")
    end
end
