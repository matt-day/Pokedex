//
//  NextEvoView.swift
//  Pokedex
//
//  Created by Matt Day on 2/14/22.
//

import SwiftUI

struct NextEvoView: View {
    @EnvironmentObject var manager : PokemonEntryManager
    @Binding var pokemon : Pokemon
    var body: some View {
        if pokemon.nextEvo?.count != 0 {
            HStack{
                Text("Next Evolutions")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding(.leading, 8)
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(pokemon.nextEvo!, id: \.self) { evo in
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

struct NextEvoView_Previews: PreviewProvider {
    static var previews: some View {
        @State var pokeStandard = Pokemon.standard
        return NextEvoView(pokemon: $pokeStandard)
            .environmentObject(PokemonEntryManager())
    }
}
