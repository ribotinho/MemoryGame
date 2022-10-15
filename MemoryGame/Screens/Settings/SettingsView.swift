//
//  SettingsView.swift
//  MemoryGame
//
//  Created by Pau Ribot Pujolras on 14/10/22.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var selectedTimer = PersistenceManager.shared.getCurrenTimer()
    private var timers = [60, 120, 180]
    let easyRecord = PersistenceManager.shared.getCurrentRecord(for: .easy)
    let mediumRecord = PersistenceManager.shared.getCurrentRecord(for: .medium)
    let difficultRecord = PersistenceManager.shared.getCurrentRecord(for: .difficult)
    
    var body: some View {
        NavigationView {
            Form {
                Section("Current records") {
                    HStack {
                        Text("Easy")
                        Spacer()
                        Text(getString(for: easyRecord))
                    }
                    HStack {
                        Text("Medium")
                        Spacer()
                        Text(getString(for: mediumRecord))
                    }
                    HStack {
                        Text("Difficult")
                        Spacer()
                        Text(getString(for: difficultRecord))
                    }
                }
                
                Section("Game") {
                    Picker("Timer", selection: $selectedTimer) {
                        ForEach(timers, id: \.self) {
                            Text("\($0) seconds")
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("Settings")
            .onDisappear{
                PersistenceManager.shared.setNewTimer(timer: selectedTimer)
            }
        }
        
    }
    
    
    private func getString(for record : Int) -> String {
        return record == 0 ? "Not set" : String("\(record) movements")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
