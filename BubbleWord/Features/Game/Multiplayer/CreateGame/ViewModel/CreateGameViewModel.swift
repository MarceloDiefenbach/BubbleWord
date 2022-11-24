//
//  CreateGameViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 23/11/22.
//

import Foundation

class CreateGameViewModel: ObservableObject {
    
    //MARK: - texts
    
    @Published var title: String = "Play game"
    @Published var instruction: String = "Share this code with your friends"
    @Published var participantsTitle: String = "Participants already in"
    @Published var startButtonLabel: String = "Start game"
    
    //MARK: - variable
    
    @Published var inviteCode: String = ""
    @Published var inviteCodeArray: Array = ["a", "a", "a", "a", "a"]
    @Published var participants: [Participant] = [Participant(id: UUID(), name: "Marcelo"), Participant(id: UUID(), name: "Chumiga")]
}
