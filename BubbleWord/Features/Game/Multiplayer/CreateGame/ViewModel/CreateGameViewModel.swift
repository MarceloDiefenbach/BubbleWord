//
//  CreateGameViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 23/11/22.
//

import Foundation

class CreateGameViewModel: ObservableObject {
    
    //MARK: - texts
    
    @Published var title: String = NSLocalizedString("createRoomTitle", comment: "")
    @Published var instruction: String = NSLocalizedString("createRoomSubtitle", comment: "")
    @Published var participantsTitle: String = NSLocalizedString("participantsAlreadyIn", comment: "")
    @Published var startButtonLabel: String = NSLocalizedString("createRoomStartButton", comment: "")
    
    //MARK: - variable
    
    @Published var inviteCode: String = ""
    @Published var inviteCodeArray: Array = ["a", "a", "a", "a", "a"]
    @Published var participants: [Participant] = [Participant(id: UUID(), name: "Marcelo"), Participant(id: UUID(), name: "Chumiga")]
    
    
    func getParticipantsOfFirebase() {
        //TODO: - update participants list
    }
}
