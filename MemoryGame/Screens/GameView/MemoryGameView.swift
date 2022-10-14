//
//  GameView.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import SwiftUI

struct MemoryGameView: View {
    
    @Environment(\.isPresented) var isPresented
    @StateObject var viewModel : MemoryGameViewModel
    
    var body: some View {
        
        ZStack {
            
            if (viewModel.showAlert) {
                AlertView(viewModel: viewModel)
                    .zIndex(2)
            }
            
            VStack {
                
                MemoryGameHeaderView(viewModel: viewModel)
                
                Spacer()
                
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, size: viewModel.game.cardSize)
                            .onTapGesture {
                                if (viewModel.game.state == .checking){
                                    print("❌ checking")
                                }else {
                                    if !card.isMatched && !card.isFlipped && !viewModel.showAlert{
                                        viewModel.tapped(card: card)
                                    }
                                }
                            }
                    }
                }
                .padding([.leading, .trailing])
                
                MenuButtonView(title: "Restart")
                    .onTapGesture {
                        viewModel.restart()
                    }
                    .padding()
            }
            .zIndex(1)
            .onChange(of: isPresented) { _ in
                viewModel.restart()
            }
        }
    }
}
