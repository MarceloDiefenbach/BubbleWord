//
//  Difficulty.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 03/01/23.
//

import Foundation

enum DifficultyTags: String {
    
    case easy, medium, hard
    
    
    var value: String {
        switch self {
        case .easy:
            return "easy"
        case .medium:
            return "medium"
        case .hard:
            return "hard"
        }
    }
}
