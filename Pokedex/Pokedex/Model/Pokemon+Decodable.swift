//
//  Pokemon+Decodable.swift
//  Pokedex
//
//  Created by Matt Day on 2/14/22.
//

import Foundation

extension Pokemon  {

    enum CodingKeys: String, CodingKey {
    case id
    case name
    case types
    case height
    case weight
    case weaknesses
    case prevEvo = "prev_evolution"
    case nextEvo = "next_evolution"
    case caught
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        types = try values.decode([PokemonType].self, forKey: .types)
        height = try values.decode(Float.self, forKey: .height)
        weight = try values.decode(Float.self, forKey: .weight)
        weaknesses = try values.decode([PokemonType].self, forKey: .weaknesses)
        prevEvo = try values.decodeIfPresent([Int].self, forKey: .prevEvo) ?? []
        nextEvo = try values.decodeIfPresent([Int].self, forKey: .nextEvo) ?? []
        caught = try values.decodeIfPresent(Bool.self, forKey: .caught) ?? false
    }
}
