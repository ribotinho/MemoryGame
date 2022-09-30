//
//  GameView.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.isPresented) var isPresented
    @ObservedObject var viewModel : GameViewModel
    @State private var movements : Int = 0
    
    var body: some View {
        
        VStack {
            
            VStack {
                HStack {
                    Text("Difficulty")
                    Spacer()
                    Text(viewModel.difficulty.rawValue)
                }
                HStack {
                    Text("Movements completed")
                    Spacer()
                    Text("\(movements)")
                }
                HStack {
                    Text("Total pairs")
                    Spacer()
                    Text("\(viewModel.pairs)")
                }
            }
            .padding([.leading, .trailing])
            Spacer()
            
            LazyVGrid(columns: viewModel.columns) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card, size: viewModel.getCardSize())
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
                .padding(.top)
        }
        .onChange(of: isPresented) { _ in
           viewModel.restart()
        }
    }
}
