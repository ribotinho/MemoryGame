//
//  Card.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var value : String
    var isFlipped = false
    var isMatched = false
    
    init(value: String){
        self.value = value
    }
}
