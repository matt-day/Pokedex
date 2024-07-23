//
//  Pokemon.swift
//  Pokedex
//
//  Created by Matt Day on 2/7/22.
//

import Foundation

struct Pokemon : Identifiable, Decodable, Encodable {
    let id: Int
    let name : String
    let types : [PokemonType]
    let height: Float
    let weight : Float
    let weaknesses: [PokemonType]
    let prevEvo: [Int]?
    let nextEvo: [Int]?
    var caught : Bool
    
    static let standard = Pokemon(id: 1, name: "Ash", types: [], height: 1.0, weight: 2.0, weaknesses: [], prevEvo: [1], nextEvo: [1], caught: false)
}
