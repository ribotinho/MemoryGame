//
//  HorizontalProgressView.swift
//  MemoryGame
//
//  Created by Pau Ribot Pujolras on 14/10/22.
//
import Foundation
import SwiftUI

struct HorizontalProgressView: View {
    
    @ObservedObject var viewModel : MemoryGameViewModel
    
    var body: some View {
        
        GeometryReader { proxy in
            ZStack (alignment: .leading){
                Color.secondary.opacity(0.75)
                    .frame(height: 15)
                    .frame(maxWidth: .infinity)
                    .clipShape(Capsule())
                
                Color.pink
                    .frame(width: calculateWidth(for: proxy.size.width), height: 15)
                    .clipShape(Capsule())
            }
        }
        .onAppear{
            viewModel.updateTimer()
        }
    }
    
    func calculateWidth(for width: CGFloat) -> CGFloat {
        let minWidth = width / CGFloat(PersistenceManager.shared.getCurrenTimer())
        return CGFloat(minWidth * CGFloat(viewModel.seconds))
    }
}

