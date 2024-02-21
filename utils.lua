local utils = {}

---
---Essa função habilita o modo UTF-8 no terminal.
---
function utils.enableUtf8()
    os.execute("chcp 65001")
end

---
---Faz o print da apresentação do simulador no terminal.
---
function utils.printHeader()
    print([[
=====================================================================

                                     ,'\
       _.----.        ____         ,'  _\   ___    ___     ____
   _,-'       `.     |    |  /`.   \,-'    |   \  /   |   |    \  |`.
   \      __    \    '-.  | /   `.  ___    |    \/    |   '-.   \ |  |
    \.    \ \   |  __  |  |/    ,','_  `.  |          | __  |    \|  |
      \    \/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |
       \     ,-'/  /   \    ,'   | \/ / ,`.|         /  /   \  |     |
        \    \ |   \_/  |   `-.  \    `'  /|  |    ||   \_/  | |\    |
         \    \ \      /       `-.`.___,-' |  |\  /| \      /  | |   |
          \    \ `.__,'|  |`-._    `|      |__| \/ |  `.__,'|  | |   |
           \_.-'       |__|    `-._ |              '-.|     '-.| |   |
                                   `'                            '-._|

                -----------------------------------------

                         GOTTA CATCH 'EM ALL 

=====================================================================

        Um pokémon selvagem apareceu, prepare-se para a batalha!

]])
end

---
---Calcula uma barra de progresso ASCII baseada em um atributo.
---@param attribute number Número de 0 a 10.
---@return string
---
function utils.getProgressBar(attribute)
    local fullChar = "▰ "
    local emptyChar = "▱ "

    local result = ""
    for i = 1, 10, 1 do
        if i <= attribute then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end

---
---Faz o print das informações de uma criatura.
---@param creature table
---
function utils.printCreature(creature)
    -- Calculate health rate
    local healthRate = math.floor((creature.health / creature.maxHealth) * 10)

    -- Cartão
    print("| " .. creature.name)
    print("| ")
    print("| " .. creature.description)
    print("| ")
    print("| Atributos")
    print("|    Vida:         " .. utils.getProgressBar(healthRate))
    print("|    Ataque:       " .. utils.getProgressBar(creature.attack))
    print("|    Defesa:       " .. utils.getProgressBar(creature.defense))
    print("|    Velocidade:   " .. utils.getProgressBar(creature.speed))
end

---Pergunta ao usuário por um número, que é retornado pela função.
---@return any
function utils.ask()
    io.write("> ")
    local answer = io.read("*n")
    return answer
end

---Função que retorna um numero aleatorio para a criatura
function utils.randomPokemon()
    local numeroAleatorio = math.random(1,3)
    return numeroAleatorio
end

--- Permite ao jogador digitar um numero e escolher um pokemon para lutar
function utils.choosePokemon()
    print("Qual pokémon você escolherá para a batalha?")
    print("1. Pikachu")
    print("2. Bulbassauro")
    print("3. Charmander")
    print("4. Squirtle")
    io.write("> ")
    local answer = io.read("*n")
    return answer
    
end

function utils.wait(seconds)
    os.execute("ping -n " .. tonumber(seconds + 1) .. " 127.0.0.1 > NUL")
end

return utils