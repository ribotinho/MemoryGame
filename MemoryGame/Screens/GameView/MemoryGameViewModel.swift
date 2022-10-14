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
    @Published var completedPairs = 0
    @Published var movements = 0
    @Published var showAlert : Bool = false
    var game : MemoryGame
    var columns : [GridItem]
    private var tappedCardIndex : Int?
    
    
    init(game: MemoryGame){
        self.game = game
        self.columns = Array(repeating: .init(.flexible()), count: game.numberOfColumns())
        self.cards = generateRandomArray()
    }
    
    
    func generateRandomArray() -> [Card] {
        var cards : [Card] = []
        var imageNames = (1...15).compactMap { "card_\($0)" }
        
        for _ in 1...game.pairs {
            if let index = imageNames.indices.randomElement() {
                cards.append(Card(value: imageNames[index]))
                cards.append(Card(value: imageNames[index]))
                imageNames.remove(at: index)
            }
        }
        
        return cards.shuffled()
    }
    
    func restart() {
        cards.removeAll()
        completedPairs = 0
        movements = 0
        cards = generateRandomArray()
    }
    
    func tapped(card: Card) {
        movements += 1
        
        game.state = .checking
        
        guard let index = cards.firstIndex(where: {$0.id == card.id}) else {
            game.state = .playing
            return
        }
        
        if !card.isMatched {
            cards[index].isFlipped.toggle()
        }
        
        guard let tappedCardIndex = tappedCardIndex else {
            game.state = .playing
            tappedCardIndex = index
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            if cards[tappedCardIndex].value == cards[index].value {
                cards[index].isMatched = true
                cards[tappedCardIndex].isMatched = true
                completedPairs += 1
                self.tappedCardIndex = nil
            }else {
                cards[index].isFlipped = false
                cards[tappedCardIndex].isFlipped = false
                self.tappedCardIndex = nil
            }
            
            game.state = .playing
            
            if completedPairs == game.pairs {
                showAlert = true
                game.state = .finished
            }
        }
    }
}
