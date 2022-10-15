//
//  PersistenceManager.swift
//  MemoryGame
//
//  Created by Pau Ribot Pujolras on 14/10/22.
//

import Foundation

struct PersistenceManager {

    
    static let shared = PersistenceManager()
    
    private init() {}
    
    private func key(for difficulty : GameDifficulty) -> String {
        switch difficulty {
        case .easy:
            return "easyRecord"
        case .medium:
            return "mediumRecord"
        case .difficult:
            return "difficultRecord"
        }
    }
    
    func setNewRecord(for difficulty: GameDifficulty, movements : Int) {
        UserDefaults.standard.set(movements, forKey: key(for: difficulty))
    }
    
    func getCurrentRecord(for difficulty: GameDifficulty) -> Int {
        return UserDefaults.standard.integer(forKey: key(for: difficulty))
    }
    
    func getCurrenTimer() -> Int {
        return UserDefaults.standard.integer(forKey: "timer")
    }
    
    func setNewTimer(timer : Int) {
        UserDefaults.standard.set(timer, forKey: "timer")
    }
    
}
