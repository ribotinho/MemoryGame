//
//  GameViewModel.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import Foundation
import SwiftUI

final class MemoryGameViewModel : ObservableObject {
    
    @Published var cards : [Card] = []
    @Published var pairs = 0
    var cardsLeft : Int = 0
    var game : MemoryGame
    var columns : [GridItem]
    var tappedCardIndex : Int?
    
    
    
    init(game: MemoryGame){
        self.game = game
        self.columns = Array(repeating: .init(.flexible()), count: game.numberOfColumns())
        self.cards = generateRandomArray()
    }
    
    
    func generateRandomArray() -> [Card] {
        print("hello im here")
        var cards : [Card] = []
        var imageNames = (1...15).compactMap { "card_\($0)" }
        
        for _ in 1...game.pairs {
            if let index = imageNames.indices.randomElement() {
                cards.append(Card(value: imageNames[index]))
                imageNames.remove(at: index)
            }
        }
        
        print("Created array of \(cards.count) cards")
        
        for card in cards {
            cards.append(Card(value: card.value))
        }
        print("duplicated array to a total of \(cards.count) cards")
        
        return cards.shuffled()
    }
    
    
    
    func restart() {
        cards.removeAll()
        cardsLeft = 0
        pairs = 0
        self.cards = generateRandomArray()
    }
    
    func tapped(card: Card) {
        guard let index = cards.firstIndex(where: {$0.id == card.id}) else { return }
        
        if !card.isMatched {
            cards[index].isFlipped.toggle()
        }
        
        guard let tappedCardIndex = tappedCardIndex else {
            tappedCardIndex = index
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            if cards[tappedCardIndex].value == cards[index].value {
                cards[index].isMatched = true
                cards[tappedCardIndex].isMatched = true
                cardsLeft += 2
                pairs += 1
                self.tappedCardIndex = nil
            }else {
                cards[index].isFlipped = false
                cards[tappedCardIndex].isFlipped = false
                self.tappedCardIndex = nil
            }
        }
     }
}
