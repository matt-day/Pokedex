//
//  PokeRowView.swift
//  Pokedex
//
//  Created by Matt Day on 2/7/22.
//

import SwiftUI

struct PokeRowView: View {
    @EnvironmentObject var manager : PokemonEntryManager
    @Binding var pokemon : Pokemon
    
    var body: some View {
        HStack {
            VStack {
                Text(String(format: "%03d", pokemon.id))
                    .foregroundColor(.gray)
                    .bold()
                    .font(.system(size: 15))
                Image(systemName: pokemon.caught ? "tag.fill" : "tag")
                    .foregroundColor(Color.accentColor)
                    .frame(width: 10, height: 10, alignment: .center)
            }
            Text(pokemon.name)
                .font(.system(size: 17))
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .fill(LinearGradient(gradient: Gradient(colors: manager.typeToColor(pokemon: pokemon)), startPoint: .top, endPoint: .bottom))
                    .frame(width: 90, height: 90, alignment: .center)
                    
                Image(String(format: "%03d", pokemon.id))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90, alignment: .center)
            }
        }
    }
}

struct PokeRowView_Previews: PreviewProvider {
    static var previews: some View {
        @State var pokeStandard = Pokemon.standard
        return PokeRowView(pokemon: $pokeStandard)
            .environmentObject(PokemonEntryManager())
    }
}
