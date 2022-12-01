//
//  WaitingRoomViewModel.swift
//  BubbleWord
//
//  Created by Annderson Packeiser Oreto on 01/12/22.
//

import SwiftUI

class WaitingRoomViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var title: String = "Waiting room"
    @Published var instruction: String = "The game will start when host get ready"
    @Published var participantsTitle: String = "Participants already in"
    @Published var participants: [Participant] = []
    var firebase: FirebaseService = FirebaseService()
    
    // MARK: - Init
    
    init() {
        self.fetchParticipants()
    }
    
    // MARK: - Functions
    
    func fetchParticipants() {
        self.firebase.getParticipants { result in
            switch result {
            case .success(let success):
                self.participants = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
