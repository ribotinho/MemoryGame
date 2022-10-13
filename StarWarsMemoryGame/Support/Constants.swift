//
//  Constants.swift
//  StarWarsMemoryGame
//
//  Created by Pau Ribot Pujolras on 13/10/22.
//

import SwiftUI

struct Fonts {
    enum FontWeight: String {
        case regular = "Regular"
        case bold = "Bold"
    }
    
    static func tangoSans(weight: FontWeight, size: CGFloat) -> Font {
        return Font.custom("TangoSans_\(weight.rawValue)", size: size)
    }
}
