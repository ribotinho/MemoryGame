//
//  CardView.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import SwiftUI

struct CardView: View {
    
    var card : Card
    var size : CGFloat
    
    var degree : Double {
        return card.isFlipped ? 0.0 : 180
    }
    var rotateX : Bool {
        return card.isFlipped
    }
    
    var body: some View {
        
        if card.isMatched {
            Image(card.value)
                .resizable()
                .renderingMode(.original)
                .scaledToFit()
                .opacity(0.25)
                .frame(height: size)
        }else {
            ZStack{
                if !card.isFlipped {
                    Text("?")
                        .font(Fonts.tangoSans(weight: .bold, size: 75))
                        .foregroundColor(Color.pink)
                        .frame(height: size)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.pink, lineWidth: 2)
                        )
                    
                }
                else {
                    Image(card.value)
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(height: size)
                }
            }
            .rotation3DEffect(.degrees(degree), axis: (x: rotateX ? 1 : 0, y:  0, z:  0))
            .animation(.easeInOut(duration: 0.5), value: degree)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(value: "card_1"), size: CGFloat(100))
    }
}
