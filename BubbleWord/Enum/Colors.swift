//
//  Colors.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

enum BWColors {
    case red, blue, yellow
    
    var color: Color {
        switch self {
            case .red:
                return Color("red")
            case .blue:
                return Color("blue")
            case .yellow:
                return Color("yellow")
        }
    }
}
