local utils = require "utils"
local pokemon = {}

local random = utils.randomPokemon()

if random == 1 then
    pokemon.name = "Rattata"
    pokemon.description = "É um Pokémon do tipo Normal, conhecido por sua agilidade, presas afiadas e hábitos noturnos, frequentemente encontrado em áreas urbanas e florestais."

    pokemon.maxHealth = 10
    pokemon.health = 10
    pokemon.attack = 2
    pokemon.defense = 3
    pokemon.speed = 4

elseif random == 2 then
    pokemon.name = "Pidgey"
    pokemon.description = "É um pequeno Pokémon do tipo Normal/Voador, conhecido por sua agilidade no ar e seu canto melodioso."

    pokemon.maxHealth = 10
    pokemon.health = 10
    pokemon.attack = 3
    pokemon.defense = 3
    pokemon.speed = 3

elseif random == 3 then
    pokemon.name = "Meowth"
    pokemon.description = "É um felino astuto do tipo Normal, conhecido por sua moeda na testa e sua habilidade em se comunicar por meio de miados humanizados"

    pokemon.maxHealth = 10
    pokemon.health = 10
    pokemon.attack = 3
    pokemon.defense = 3
    pokemon.speed = 6
end



return pokemon