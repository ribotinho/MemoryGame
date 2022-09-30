//
//  GameViewModel.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import Foundation
import SwiftUI

final class GameViewModel : ObservableObject {
    
    @Published var cards : [Card] = []
    @Published var pairs = 0
    var cardsLeft : Int = 0
    var difficulty : GameDifficulty
    var columns : [GridItem]
    var tappedCardIndex : Int?
    
    init(difficulty: GameDifficulty){
        self.difficulty = difficulty
        self.columns = Array(repeating: .init(.flexible()), count: difficulty.numberOfColumns())
        self.cards = generateArrayFromRandomElements(count: difficulty.numberOfCards() / 2)
    }
    
    func generateArrayFromRandomElements(count : Int) -> [Card] {
        
        var cards : [Card] = []
        var values : [String] = ["😇", "😍", "😎", "🤪", "🤬", "🥶"]
        
        for _ in 1...count {
            if let index = values.indices.randomElement() {
                cards.append(Card(value: values[index]))
                values.remove(at: index)
            }
        }
        
        for card in cards {
            cards.append(Card(value: card.value))
        }
        
        return cards.shuffled()
    }
    
    func getCardSize() -> CGFloat {
        switch difficulty {
        case .easy:
            return 300
        case .medium:
            return 150
        case .difficult:
            return 150
        }
    }
    
    func restart() {
        cards.removeAll()
        cardsLeft = 0
        pairs = 0
        self.cards = generateArrayFromRandomElements(count: difficulty.numberOfCards() / 2)
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
