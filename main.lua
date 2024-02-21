-- Dependencies
local utils = require("utils")

local pikachu = require("pokemon_player.pikachu")
local bulbasaur = require("pokemon_player.bulbasaur")
local charmander = require("pokemon_player.charmander")
local squirtle = require("pokemon_player.squirtle")

local pikachuActions = require("pokemon_player.pikachu_actions")
local bulbasaurActions = require("pokemon_player.bulbasaur_actions")
local charmanderActions = require("pokemon_player.charmander_actions")
local squirtleActions = require("pokemon_player.squirtle_actions")

local pokemonInimigo = require("pokemon_inimigo.pokemon_inimigo")
local pokemonInimigoActions = require("pokemon_inimigo.actions")

-- Habilitar UTF-8 no terminal
utils.enableUtf8()

-- Header
utils.printHeader()

-- Obter definição do monstro
local boss = pokemonInimigo
local bossActions = pokemonInimigoActions

-- Apresentar o monstro
utils.printCreature(boss)
utils.wait(1)

print()

-- Obter definição do player
local options = utils.choosePokemon()

local player = {}
local playerActions = {}

if options == 1 then
    player = pikachu
    playerActions = pikachuActions
elseif options == 2 then
    player = bulbasaur
    playerActions = bulbasaurActions
elseif options == 3 then
    player = charmander
    playerActions = charmanderActions
elseif options == 4 then
    player = squirtle
    playerActions = squirtleActions
else
    print(string.format("Opção inválida, o %s fugiu!", boss.name))
end
print(string.format("Você escolheu %s!", player.name))
print()

if options > 0 and options < 5 then
    -- Build actions
    playerActions.build()
    bossActions.build()

    -- Começar o loop de batalha
    while true do
        -- Mostrar ações para o jogador
        print()
        utils.wait(1)
        print(string.format("Qual será a próxima ação de %s?", player.name))
        local validPlayerActions = playerActions.getValidActions(player, boss)
        for i, action in pairs(validPlayerActions) do
            print(string.format("%d. %s", i, action.description))
        end
        local chosenIndex = utils.ask()
        local chosenAction = validPlayerActions[chosenIndex]
        local isActionValid = chosenAction ~= nil

        -- Simular o turno do jogador
        if isActionValid then
            chosenAction.execute(player, boss)
        else
            print(string.format("Sua escolha é inválida. %s perdeu a vez.", player.name))
        end

        -- Ponto de saída: Criatura ficou sem vida
        if boss.health <= 0 then
            break
        end

        -- Simular turno da criatura
        print()
        print("O inimigo se preparando...")
        utils.wait(2)
        
        local validBossActions = bossActions.getValidActions(player, boss)
        local bossAction = validBossActions[math.random(#validBossActions)]
        bossAction.execute(player, boss)

        -- Ponto de saída: Jogador ficou sem vida
        if player.health <= 0 then
            break
        end
    end

    utils.wait(1)

    -- Processar condições de vitória e derrota
    if player.health <= 0 then
        print()
        print("---------------------------------------------------------------------")
        print()
        print("😭")
        print(string.format("%s não foi capaz de vencer %s.", player.name, boss.name))
        print("Quem sabe na próxima vez...")
        print()
    elseif boss.health <= 0 then
        print()
        print("---------------------------------------------------------------------")
        print()
        print("🥳")
        print(string.format("%s prevaleceu e venceu %s.", player.name, boss.name))
        print("Parabéns!!!")
        print()
    end
end
