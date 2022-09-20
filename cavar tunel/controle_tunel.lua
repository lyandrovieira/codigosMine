rednet.open("back")

function menu()
    print("a) Alterar quantidade de blocos")
    print("b) Mudar direção de escavação")
    print("c) Construir escadaria")
    print("d) Encerra escavação")
end

function definirQtdBlocos()
    print("Digite o tamanho do túnel: ")
    tamanho = read()
    rednet.send(0, tamanho, "qtdblocos")
    --print("Cavando túnel com "..tamanho.." blocos de comprimento")
end

function iniciar()
    print("Pressione a tecla 'i' para iniciar a escavação.")
    local event, character = os.pullEvent("char")
    if character == "i" then
        rednet.send(0, "dig", "iniciar")
    end
end

while true do

    print("Digite o tamanho do túnel: ")
    tamanho = read()
    rednet.send(0, tamanho, "qtdblocos")
    --print("Cavando túnel com "..tamanho.." blocos de comprimento")

    print("Pressione a tecla 'i' para iniciar a escavação.")
    local event, character = os.pullEvent("char")
    if character == "i" then
        rednet.send(0, "dig", "iniciar")
    end

    while true do
        status = { rednet.receive("status") }
        print("Escavação concluída! Seleceione uma das opções a seguir:")
        menu()
        local resp = read()

        if resp == "a" then -- Permite alterar a quantidade de blocos escavados após a primeira execução do código.
            rednet.send(0, "bloco", "menu")
            definirQtdBlocos()
            iniciar()
        end

        if resp == "b" then -- Permite alterar a direção do túnel (virar p/ direita ou esquerda) sem reposicionar manualmente a turtle.
            rednet.send(0, "direcao", "menu")

            print("Virar para:")
            print("Direita -> Pressione d")
            print("Esquerda -> Pressione e")
            local event, character = os.pullEvent("char")

            if character == "d" then
                rednet.send(0, "d", "direcao")
            end
            if character == "e" then
                rednet.send(0, "e", "direcao")
            end

            definirQtdBlocos()
            iniciar()
        end

        if resp == "c" then
            rednet.send(0, "escada", "menu")
            print("Digite a quantidade de degraus: ")
            degrau = read()
            rednet.send(0, degrau, "qtddegrau")
        end

        if resp == "d" then -- Encerra o processo de escavação de túneis.
            rednet.send(0, "break", "menu")
            break
        end
    end
    break
end
