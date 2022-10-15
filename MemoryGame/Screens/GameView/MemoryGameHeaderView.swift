//
//  MemoryGameHeaderView.swift
//  MemoryGame
//
//  Created by Pau Ribot Pujolras on 14/10/22.
//

import SwiftUI

struct MemoryGameHeaderView: View {
    
    @ObservedObject var viewModel : MemoryGameViewModel
    
    var body: some View {
        VStack{
            HStack {
                Text("Difficulty level")
                    .font(Fonts.tangoSans(weight: .regular, size: 16))
                Spacer()
                Text(viewModel.game.difficulty.rawValue)
                    .font(Fonts.tangoSans(weight: .bold, size: 16))
            }
            HStack {
                Text("Movements completed")
                    .font(Fonts.tangoSans(weight: .regular, size: 16))
                Spacer()
                Text("\(viewModel.movements)")
                    .font(Fonts.tangoSans(weight: .bold, size: 16))
            }
            HStack {
                Text("Total pairs found")
                    .font(Fonts.tangoSans(weight: .regular, size: 16))
                Spacer()
                Text("\(viewModel.completedPairs)")
                    .font(Fonts.tangoSans(weight: .bold, size: 16))
            }
            
            HorizontalProgressView(viewModel: viewModel)
        }
        .padding([.leading, .trailing])
    }
}

