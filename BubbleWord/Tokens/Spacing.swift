//
//  Spacing.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 19/11/22.
//

import Foundation

enum Spacing: String {
    case quarck, nano, xxxs, xxs, xs, small, medium, large
    
    var value: CGFloat {
        switch self {
        case .quarck:
            return 4
        case .nano:
            return 8
        case .xxxs:
            return 16
        case .xxs:
            return 24
        case .xs:
            return 32
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 56
        }
    }
}
