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
}

enum GameState : String{
    case playing = "playing"
    case checking = "checking"
    case finished = "finished"
}

struct MemoryGame {
    var difficulty : GameDifficulty
    var state : GameState = .playing
    
    func numberOfColumns() -> Int {
        switch difficulty {
        case .easy:
            return 4
        case .medium:
            return 4
        case .difficult:
            return 6
        }
    }
    
    var pairs : Int {
        switch difficulty {
        case .easy:
            return 8
        case .medium:
            return 12
        case .difficult:
            return 15
        }
    }
    
    var cardSize : CGFloat {
        switch difficulty {
        case .easy:
            return 115
        case .medium:
            return 85
        case .difficult:
            return 85
        }
    }
}
