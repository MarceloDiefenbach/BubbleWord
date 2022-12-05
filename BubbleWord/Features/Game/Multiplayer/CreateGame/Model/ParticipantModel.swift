//
//  ParticipantModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 21/11/22.
//

import Foundation

struct Participant: Identifiable, Hashable {
    var id: UUID
    var name: String
}
