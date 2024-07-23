//
//  BodyTypeView.swift
//  Pokedex
//
//  Created by Matt Day on 2/8/22.
//

import SwiftUI

struct BodyTypeView: View {
    @Binding var pokemon : Pokemon
    var body: some View {
        HStack{
            VStack {
                Text("Height")
                    .font(.system(size: 20, weight: .semibold , design: .rounded))
                Text(String(format: "%.2f", pokemon.height) + " m")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            Spacer()
            VStack {
                Text("Weight")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                Text(String(format: "%.2f", pokemon.weight) + " kg")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
        }
        .frame(width: 175)
    }
}

struct BodyTypeView_Previews: PreviewProvider {
    static var previews: some View {
        @State var pokeStandard = Pokemon.standard
        return BodyTypeView(pokemon: $pokeStandard)
            .environmentObject(PokemonEntryManager())
    }
}
