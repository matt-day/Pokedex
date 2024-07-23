//
//  ContentView.swift
//  Pokedex
//
//  Created by Matt Day on 2/7/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager : PokemonEntryManager
    var sectionInfos : [SectionInfo] { manager.sectionInfo()}
    @State var filterType: PokemonType?
    var body: some View {
        List {
            if filterType == nil {
                ForEach(manager.pokemonModel.pokemonList.indices, id:\.self) {
                    i in
                    NavigationLink(destination: PokeDetailView(pokemon: $manager.pokemonModel.pokemonList[i]), label: {
                        PokeRowView(pokemon: $manager.pokemonModel.pokemonList[i])
                    })
                }
            } else {
                ForEach(manager.pokemonModel.pokemonList.indices, id:\.self) {
                    i in
                    if manager.filterCheck(pokemon: manager.pokemonModel.pokemonList[i], filter: filterType) {
                        NavigationLink(destination: PokeDetailView(pokemon: $manager.pokemonModel.pokemonList[i]), label: {
                            PokeRowView(pokemon: $manager.pokemonModel.pokemonList[i])
                        })
                    }
                }
            }
        }
        .navigationTitle(filterType?.rawValue ?? "All Types")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Picker("Pokemon Type", selection: $filterType) {
                    Text("All Types").tag(nil as PokemonType?)
                    ForEach(PokemonType.allCases, id:\.self){ type in
                        Text(type.rawValue).tag(type as PokemonType?)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PokemonEntryManager())
    }
}
