//
//  Game.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import UIKit

enum GameDifficulty : String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case difficult = "Difficult"
    
    func numberOfColumns() -> Int {
        switch self {
        case .easy:
            return 2
        case .medium:
            return 2
        case .difficult:
            return 4
        }
    }
    
    func numberOfCards() -> Int {
        switch self {
        case .easy:
            return 4
        case .medium:
            return 8
        case .difficult:
            return 16
        }
    }

}

struct Game {
    var cards : [Card]
}
