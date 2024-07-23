//
//  PokeDetailView.swift
//  Pokedex
//
//  Created by Matt Day on 2/7/22.
//

import SwiftUI

struct PokeDetailView: View {
    @EnvironmentObject var manager : PokemonEntryManager
    @Binding var pokemon : Pokemon
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                CaptureView(capture: $pokemon.caught)
                BioDetailView(pokemon: $pokemon)
                BodyTypeView(pokemon: $pokemon)
                Spacer(minLength: 5)
                Divider()
                Spacer(minLength: 5)
                Group {
                    HStack{
                        Text("Types")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding(.leading, 8)
                        Spacer()
                    }
                    TypesView(pokemon: $pokemon)
                    Spacer(minLength: 5)
                    HStack{
                        Text("Weaknesses")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding(.leading, 8)
                        Spacer()
                    }
                    WeakView(pokemon: $pokemon)
                }
                Group {
                    Spacer(minLength: 5)
                    PrevEvoView(pokemon: $pokemon)
                    Spacer(minLength: 5)
                    NextEvoView(pokemon: $pokemon)
                }
            }
        }
        .navigationTitle(pokemon.name + " - " + String(format: "%03d", pokemon.id))
    }
}

struct PokeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        @State var pokeStandard = Pokemon.standard
        return PokeDetailView(pokemon: $pokeStandard)
            .environmentObject(PokemonEntryManager())
    }
}
