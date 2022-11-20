//
//  FontSize.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 19/11/22.
//

import Foundation

enum FontSize: String {
    case xxs, xs, small, medium, large, extraLarge, extraExtraLarge
    
    var value: CGFloat {
        switch self {
        case .xxs:
            return 12
        case .xs:
            return 16
        case .small:
            return 20
        case .medium:
            return 24
        case .large:
            return 32
        case .extraLarge:
            return 40
        case .extraExtraLarge:
            return 60
        }
    }
}
