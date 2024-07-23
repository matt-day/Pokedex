//
//  TypesView.swift
//  Pokedex
//
//  Created by Matt Day on 2/8/22.
//

import SwiftUI

struct TypesView: View {
    @Binding var pokemon : Pokemon
    var body: some View {
        ScrollView(.horizontal) {
            HStack() {
                ForEach(pokemon.types.indices) { i in
                    ZStack {
                        Capsule()
                            .fill(Color(pokemonType: pokemon.types[i]))
                        Text(pokemon.types[i].rawValue)
                            .padding(5)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    }
                }
            }
        }
    }
}

struct TypesView_Previews: PreviewProvider {
    static var previews: some View {
        @State var pokeStandard = Pokemon.standard
        return TypesView(pokemon: $pokeStandard)
            .environmentObject(PokemonEntryManager())
    }
}
