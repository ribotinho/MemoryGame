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
    @Published var seconds : Int = PersistenceManager.shared.getCurrenTimer()
    var type : AlertType?
    var game : MemoryGame
    var columns : [GridItem]
    var timer : Timer?
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
        tappedCardIndex = nil
        seconds = PersistenceManager.shared.getCurrenTimer()
        stopTimer()
        cards = generateRandomArray()
    }
    
    func tapped(card: Card) {
        
        if movements == 0 { startTimer() }
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
                stopTimer()
                game.state = .finished
                
                let currentRecord = PersistenceManager.shared.getCurrentRecord(for: game.difficulty)
                if movements < currentRecord {
                    type = .record
                    showAlert = true
                    PersistenceManager.shared.setNewRecord(for: game.difficulty, movements: movements)
                }else {
                    type = .win
                    showAlert = true
                }
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.seconds -= 1
            if self.seconds == 0 {
                self.type = .timeout
                self.showAlert = true
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func updateTimer() {
        seconds = PersistenceManager.shared.getCurrenTimer()
    }
}
