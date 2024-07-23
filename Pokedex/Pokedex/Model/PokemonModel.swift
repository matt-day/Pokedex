//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Matt Day on 2/7/22.
//

import Foundation

struct PokemonModel {
    let manager : PokemonManager
    var pokemonList : [Pokemon]
    

    init() {
        manager = PokemonManager()
        pokemonList = manager.pokemon
    }
    
    func save() {
        manager.save(pokemon: pokemonList)
    }
    
}
