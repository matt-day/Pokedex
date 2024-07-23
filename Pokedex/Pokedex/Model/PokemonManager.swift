//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Matt Day on 2/7/22.
//

import Foundation

class PokemonManager {
    var pokemon : [Pokemon]
    let filename = "pokedex"
    let fileInfo : FileInfo
    
    init() {
        
        fileInfo = FileInfo(for: filename)
        
        if fileInfo.exists{
            let decoder = JSONDecoder()
            do {
                let data = try Data(contentsOf: fileInfo.url)
                pokemon = try decoder.decode([Pokemon].self, from: data)
            } catch {
                print(error)
                pokemon = []
            }
            
            return
        }
        
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: ".json")!
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            pokemon = try decoder.decode([Pokemon].self, from: data)
        } catch {
            print(error)
            pokemon = []
        }
    }
    
    func save(pokemon:[Pokemon]){
        do {
            let encoder = JSONEncoder()
            let data    = try encoder.encode(pokemon)
            try data.write(to: fileInfo.url)
        } catch {
            print(error)
        }
    }
    
}
