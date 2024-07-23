//
//  CardView.swift
//  Pokedex
//
//  Created by Matt Day on 2/14/22.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var manager : PokemonEntryManager
    @Binding var pokemon : Pokemon
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: manager.typeToColor(pokemon: pokemon)), startPoint: .top, endPoint: .bottom))
                .frame(width: 130, height: 200, alignment: .center)
            VStack {
                Image(String(format: "%03d", pokemon.id))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                Text(pokemon.name)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                HStack {
                    Spacer(minLength: 0.5)
                    if pokemon.caught {
                        Image(systemName: "tag.fill")
                            .foregroundColor(Color.accentColor)
                            .frame(width: 10, height: 10, alignment: .center)
                    }
                }
                .frame(width: 100, height: 15, alignment: .center)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        @State var pokeStandard = Pokemon.standard
        return CardView(pokemon: $pokeStandard)
            .preferredColorScheme(.dark)
            .environmentObject(PokemonEntryManager())
    }
}
