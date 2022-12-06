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
    
    // MARK: - Init
    
    init() {
        self.fetchParticipants()
    }
    
    // MARK: - Functions
    
    func fetchParticipants() {
        FirebaseService.instance.participantsListener { result in
            switch result {
            case .success(let success):
                self.participants = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func leaveRoom() {
        FirebaseService.instance.leaveRoom { result in
            //TODO: - back to homeViewz
        }
    }
}
