//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Matt Day on 2/7/22.
//

import SwiftUI

@main
struct PokedexApp: App {
    @StateObject var pokemonEntryManager = PokemonEntryManager()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            TypeSectionView()
                .environmentObject(pokemonEntryManager)
        }
        .onChange(of: scenePhase) { phase in
            switch phase{
            case .inactive:
                pokemonEntryManager.pokemonModel.save()
                break
            default:
                break
            }
        }
    }
}

