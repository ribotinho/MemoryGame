//
//  StarWarsMemoryGameApp.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import SwiftUI

@main
struct StarWarsMemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                
                OnboardingView()
                    .tabItem {
                        Label("Play", systemImage: "gamecontroller")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            
        }
    }
}
