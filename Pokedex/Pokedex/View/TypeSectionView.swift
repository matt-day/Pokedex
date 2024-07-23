//
//  TypeSectionView.swift
//  Pokedex
//
//  Created by Matt Day on 2/15/22.
//

import SwiftUI

struct TypeSectionView: View {
    
    @EnvironmentObject var manager : PokemonEntryManager
    var sectionInfos : [SectionInfo] { manager.sectionInfo()}
    var body: some View {
        NavigationView{
            List {
                if manager.caughtPokemon.count > 0 {
                    Text("Captured")
                    SectionView(indices: manager.updateCaughtPokemon())
                }
                
                ForEach(sectionInfos) { sectionInfo in
                    Text(sectionInfo.title)
                    SectionView(indices: sectionInfo.indicies)
                }
            }
            .navigationTitle("Pokédex")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "list.number")
                        }
                    }
                }
            }
        }
    }
}

struct TypeSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TypeSectionView()
    }
}
