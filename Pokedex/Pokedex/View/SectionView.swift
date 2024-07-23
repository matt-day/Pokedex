//
//  SectionView.swift
//  Pokedex
//
//  Created by Matt Day on 2/15/22.
//

import SwiftUI

struct SectionView: View {
    @EnvironmentObject var manager : PokemonEntryManager
    let indices : [Int]
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack() {
                ForEach(indices, id: \.self) { i in
                    NavigationLink(destination: PokeDetailView(pokemon: $manager.pokemonModel.pokemonList[i])) {
                        CardView(pokemon: $manager.pokemonModel.pokemonList[i])
                    }
                }
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            SectionView(indices: [0,1,2,3])
                .environmentObject(PokemonEntryManager())
        }
    }
}
