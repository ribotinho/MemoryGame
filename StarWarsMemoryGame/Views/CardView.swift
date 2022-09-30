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
            Color(.systemBackground)
                .frame(height: size)
                .cornerRadius(15)
        }else {
            ZStack{
                if card.isFlipped {
                    Color(.secondarySystemBackground)
                        .frame(height: size)
                        .cornerRadius(15)
                }
                else {
                    Image("vaderCardBack")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFit()
                        .frame(height: size)
                        .border(.black, width: 2)
                        .cornerRadius(15)
                }
                
                Text(card.isFlipped ? card.value : "")
            }
            .rotation3DEffect(.degrees(degree), axis: (x: rotateX ? 1 : 0, y:  0, z:  0))
            .animation(.easeInOut(duration: 0.5), value: degree)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(value: "😀"), size: CGFloat(100))
    }
}
