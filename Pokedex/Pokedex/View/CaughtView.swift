//
//  CaughtView.swift
//  Pokedex
//
//  Created by Matt Day on 2/15/22.
//

import SwiftUI

struct CaughtView: View {
    @EnvironmentObject var manager : PokemonEntryManager
    var pokemon : [Pokemon]
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(pokemon) { poke in
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(LinearGradient(gradient: Gradient(colors: manager.typeToColor(pokemon: poke)), startPoint: .top, endPoint: .bottom))
                            .frame(width: 130, height: 200, alignment: .center)
                        VStack {
                            Image(String(format: "%03d", poke.id))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100, alignment: .center)
                            Text(poke.name)
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

struct CaughtView_Previews: PreviewProvider {
    static var previews: some View {
        CaughtView(pokemon: [Pokemon]())
    }
}
