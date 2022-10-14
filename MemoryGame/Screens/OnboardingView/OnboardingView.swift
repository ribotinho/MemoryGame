//
//  OnboardingView.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                Image("fruit")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.top, 50)
                
                Spacer()
                    .frame(height: 100)
                
                Text("Choose your difficulty")
                    .font(Fonts.tangoSans(weight: .regular, size: 30))
                    .padding(.bottom)
                
                ForEach(GameDifficulty.allCases, id: \.self) { difficulty in
                    
                    let gameViewModel = MemoryGameViewModel(game: MemoryGame(difficulty: difficulty))
                    
                    NavigationLink(destination: MemoryGameView(viewModel: gameViewModel)){
                        MenuButtonView(title: difficulty.rawValue)
                            .padding([.leading, .trailing])
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
