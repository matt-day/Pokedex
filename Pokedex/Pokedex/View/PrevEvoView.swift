//
//  PrevEvoView.swift
//  Pokedex
//
//  Created by Matt Day on 2/14/22.
//

import SwiftUI

struct PrevEvoView: View {
    @EnvironmentObject var manager : PokemonEntryManager
    @Binding var pokemon : Pokemon
    var body: some View {
        if pokemon.prevEvo?.count != 0 {
            HStack{
                Text("Previous Evolutions")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.leading, 8)
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(pokemon.prevEvo!, id: \.self) { evo in
                        NavigationLink(destination: PokeDetailView(pokemon: $manager.pokemonModel.pokemonList[evo-1]), label: {
                            CardView(pokemon: $manager.pokemonModel.pokemonList[evo-1])
                        })
                    }
                }
            }
        } else {
            EmptyView()
        }
    }
}

struct PrevEvoView_Previews: PreviewProvider {
    static var previews: some View {
        @State var pokeStandard = Pokemon.standard
        return PrevEvoView(pokemon: $pokeStandard)
            .environmentObject(PokemonEntryManager())
    }
}
