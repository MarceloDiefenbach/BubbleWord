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
    @Published var finisButtonLabel: String = NSLocalizedString("finishRoomStartButton", comment: "")
    @Published var finisButtonIcon: String = "rectangle.portrait.and.arrow.right"
    
    //MARK: - variable
    
    @Published var inviteCode: String = FirebaseService.instance.roomCode
    @Published var inviteCodeArray: Array = "\(FirebaseService.instance.roomCode)".components(separatedBy: "")
    @Published var participants: [Participant] = []
    
    init() {
        self.getParticipantsOfFirebase()
    }
    
    
    func getParticipantsOfFirebase() {
        FirebaseService.instance.participantsListener { result in
            switch result {
            case .success(let success):
                print(success)
                self.participants = success
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func deleteRoom(){
        FirebaseService.instance.deleteRoom { result in
//            homeCoordinator.isPresentingView = .home
            //TODO: - fix to return result of delete
            //TODO: - go to homeView
        }
    }
}
