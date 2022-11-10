//
//  Letter.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 06/11/22.
//

import Foundation

struct Letter {
    var letter: String
    var state: StateOfLetter
    var colorIndex: Int
}

enum StateOfLetter {
    case active, inactive
}


enum SoundTypes {
    case action, environment
    
    var description: String {
        switch self {
            case .action:
                return "actionSound"
            case .environment:
                return "environmentSound"
        }
    }
}
