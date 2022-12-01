//
//  Model.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 26/11/22.
//

import Foundation

struct Room {
    var code: String
    var participants: [Participant]
    var hasBegun: Bool
    var letters: [Letter]
    var question: Question
    
}

struct Question {
    var questionText: String
    var questionColor: Int
}
