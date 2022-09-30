//
//  MenuButtonView.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 30/9/22.
//

import SwiftUI

struct MenuButtonView: View {
    
    var title : String
    
    var body: some View {
        
        Text(title)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.black)
            .foregroundColor(.yellow)
            .clipShape(Capsule())
        
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(title: "easy")
    }
}
