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
                
                Image("SWLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.top)
                
                Spacer()
                
                Text("Choose your difficulty")
                    .font(.title)
                
                ForEach(GameDifficulty.allCases, id: \.self) { diffculty in
                    
                    let gameViewModel = GameViewModel(difficulty: diffculty)
                    NavigationLink(destination: GameView(viewModel: gameViewModel)){
                        MenuButtonView(title: diffculty.rawValue)
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
