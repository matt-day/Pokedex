//
//  PokemonEntryManager.swift
//  Pokedex
//
//  Created by Matt Day on 2/7/22.
//

import Foundation
import SwiftUI

struct SectionInfo : Identifiable {
    let title : String  // title for section
    let indicies : [Int]  // indices of pokemon for section
    var id : String {title}
}

class PokemonEntryManager : ObservableObject {
    @Published var pokemonModel = PokemonModel()
    
    var caughtPokemon : [Pokemon] {pokemonModel.pokemonList.filter({$0.caught})}

    func updateCaughtPokemon() -> [Int]{
        var indices = [Int]()
        for poke in caughtPokemon{
            indices.append(poke.id-1)
        }
        return indices
    }
    
    
    func typeToColor(pokemon: Pokemon) -> [Color]{
        var newColors = [Color]()
        for i in pokemon.types.indices{
            newColors.append(Color(pokemonType: pokemon.types[i]))
        }
        return newColors
    }

    

    func indices(for property : (Pokemon) -> Bool) -> [Int] {
            let filteredPokemon =  pokemonModel.pokemonList.filter(property)
            
            let indices = filteredPokemon.map {s in
                pokemonModel.pokemonList.firstIndex(where: {$0.name == s.name})! }            
            return indices.sorted()
    }
    
    func sectionInfo() -> [SectionInfo] {
        let titles = PokemonType.allCases
        let info = titles.map {t in
            SectionInfo(title: t.rawValue, indicies: indices(for: {s in
                s.types.contains(t)}))
        }
        return info
    }
    
    func filterCheck(pokemon: Pokemon, filter: PokemonType? ) -> Bool {
        if pokemon.types.contains(filter!) {
            return true
        }
        return false
    }
}
