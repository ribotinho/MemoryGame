//
//  MemoryGameHeaderView.swift
//  MemoryGame
//
//  Created by Pau Ribot Pujolras on 14/10/22.
//

import SwiftUI

struct MemoryGameHeaderView: View {
    
    var viewModel : MemoryGameViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Difficulty")
                    .font(Fonts.tangoSans(weight: .regular, size: 16))
                Spacer()
                Text(viewModel.game.difficulty.rawValue)
            }
            HStack {
                Text("Movements completed")
                    .font(Fonts.tangoSans(weight: .regular, size: 16))
                Spacer()
                Text("\(viewModel.movements)")
            }
            HStack {
                Text("Total pairs")
                    .font(Fonts.tangoSans(weight: .regular, size: 16))
                Spacer()
                Text("\(viewModel.completedPairs)")
            }
        }
        .padding([.leading, .trailing])
    }
}

struct MemoryGameHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameHeaderView(viewModel: MemoryGameViewModel(game: MemoryGame(difficulty: .easy)))
    }
}
