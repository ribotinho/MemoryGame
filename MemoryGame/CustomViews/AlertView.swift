//
//  AlertView.swift
//  MemoryGame
//
//  Created by Pau Ribot Pujolras on 14/10/22.
//

import SwiftUI

enum AlertType {
    case win
    case record
    case timeout
}

struct AlertView: View {
    
    var viewModel : MemoryGameViewModel
    var buttonWidth : CGFloat = 125
    var title : String  {
        switch viewModel.type {
        case .win, .record:
            return "Congratulations! 🥳"
        case .timeout:
            return "Timeout! ⏰"
        case .none:
            return ""
        }
    }
    
    var description : String  {
        switch viewModel.type {
        case .win:
            return "You have successfully completed the game. You rock!"
        case .record:
            return "WOW, you're amazing! You have established a new record for this difficulty!"
        case .timeout:
            return "You have run out of time.\nBetter luck next time! "
        case .none:
            return ""
        }
    }
    
    var body: some View {
        ZStack {
            
            Color.white
                .cornerRadius(15)
            
            VStack{
                VStack(alignment: .leading) {
                    Text(title)
                        .font(Fonts.tangoSans(weight: .bold, size: 25))
                        .foregroundColor(.pink)
                        .padding(.bottom)
                    
                    Text(description)
                        .font(Fonts.tangoSans(weight: .regular, size: 15))
                }
                
                Spacer ()
                
                HStack{
                    
                    Button {
                        viewModel.showAlert = false
                    } label: {
                        Text("Back")
                            .frame(width: buttonWidth, height: 30)
                            .font(Fonts.tangoSans(weight: .bold, size: 15))
                            .background(Color.secondary.opacity(0.25))
                            .foregroundColor(.pink)
                            .clipShape(Capsule())
                    }
                    
                    Button {
                        viewModel.showAlert = false
                        viewModel.restart()
                    } label: {
                        Text("Play Again")
                            .frame(width: buttonWidth, height: 30)
                            .font(Fonts.tangoSans(weight: .bold, size: 15))
                            .background(.pink)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
            }
            .padding()
        }
        .frame(width: 150, height: 200)
        .shadow(radius: 10)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(viewModel: MemoryGameViewModel(game: MemoryGame(difficulty: .easy)))
    }
}
