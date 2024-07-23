//
//  BioDetailView.swift
//  Pokedex
//
//  Created by Matt Day on 2/8/22.
//

import SwiftUI

struct BioDetailView: View {
    @EnvironmentObject var manager : PokemonEntryManager
    @Binding var pokemon : Pokemon
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: manager.typeToColor(pokemon: pokemon)), startPoint: .top, endPoint: .bottom))
                .frame(width: 300, height: 300, alignment: .center)
                
            Image(String(format: "%03d", pokemon.id))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250, alignment: .center)
        }
    }
}

struct BioDetailView_Previews: PreviewProvider {
    static var previews: some View {
        @State var pokeStandard = Pokemon.standard
        return BioDetailView(pokemon: $pokeStandard)
            .environmentObject(PokemonEntryManager())
    }
}
