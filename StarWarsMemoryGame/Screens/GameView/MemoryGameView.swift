//
//  GameView.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import SwiftUI

struct MemoryGameView: View {
    
    @Environment(\.isPresented) var isPresented
    @ObservedObject var viewModel : MemoryGameViewModel
    @State private var movements : Int = 0
    
    var body: some View {
        
        VStack {
            
            VStack {
                HStack {
                    Text("Difficulty")
                        .font(Fonts.tangoSans(weight: .regular, size: 16))
                    Spacer()
                    Text(viewModel.game.rawValue)
                }
                HStack {
                    Text("Movements completed")
                        .font(Fonts.tangoSans(weight: .regular, size: 16))
                    Spacer()
                    Text("\(movements)")
                }
                HStack {
                    Text("Total pairs")
                        .font(Fonts.tangoSans(weight: .regular, size: 16))
                    Spacer()
                    Text("\(viewModel.pairs)")
                }
            }
            .padding([.leading, .trailing])
            Spacer()
            
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card, size: viewModel.game.cardSize)
                        .onTapGesture {
                            movements += 1
                            viewModel.tapped(card: card)
                        }
                }
            }
            .padding([.leading, .trailing])
            
            MenuButtonView(title: "Restart")
                .onTapGesture {
                    movements = 0
                    viewModel.restart()
                }
                .padding()
        }
        .onChange(of: isPresented) { _ in
           viewModel.restart()
        }
    }
}
