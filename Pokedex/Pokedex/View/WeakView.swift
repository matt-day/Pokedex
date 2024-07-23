//
//  WeakView.swift
//  Pokedex
//
//  Created by Matt Day on 2/8/22.
//

import SwiftUI

struct WeakView: View {
    @Binding var pokemon : Pokemon
    var body: some View {
        ScrollView(.horizontal) {
            HStack() {
                ForEach(pokemon.weaknesses.indices) { i in
                    ZStack {
                        Capsule()
                            .fill(Color(pokemonType: pokemon.weaknesses[i]))
                        Text(pokemon.weaknesses[i].rawValue)
                            .padding(5)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                
                    }
                }
            }
        }
    }
}

struct WeakView_Previews: PreviewProvider {
    static var previews: some View {
        @State var pokeStandard = Pokemon.standard
        return WeakView(pokemon: $pokeStandard)
            .environmentObject(PokemonEntryManager())
    }
}
