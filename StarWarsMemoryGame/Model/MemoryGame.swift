//
//  Game.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import UIKit

enum MemoryGame : String, CaseIterable {
    case easy = "Easy"
    case medium = "Medium"
    case difficult = "Difficult"
    
    func numberOfColumns() -> Int {
        switch self {
        case .easy:
            return 4
        case .medium:
            return 4
        case .difficult:
            return 6
        }
    }
    
    var pairs : Int {
        switch self {
        case .easy:
            return 8
        case .medium:
            return 12
        case .difficult:
            return 15
        }
    }
    
    var cardSize : CGFloat {
        switch self {
        case .easy:
            return 115
        case .medium:
            return 85
        case .difficult:
            return 85
        }
    }
}
