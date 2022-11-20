//
//  CornerRadius.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 19/11/22.
//

import Foundation

enum CornerRadius: String {
    case none, small, circular
    
    var value: CGFloat {
        switch self {
        case .none:
            return 0
        case .small:
            return 16
        case .circular:
            return 500

        }
    }
}
