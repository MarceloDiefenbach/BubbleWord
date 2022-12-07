//
//  MultiplayerViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 03/12/22.
//

import Foundation

class MultiplayerViewModel: ObservableObject {

    // MARK: - Variables
    
    @Published var title = NSLocalizedString("multiplayerTitle", comment: "")
    @Published var texfield = NSLocalizedString("multiplayerField", comment: "")
    @Published var createSessionButton = NSLocalizedString("createSessionButton", comment: "")
    @Published var joinSessionButton = NSLocalizedString("joinSessionButton", comment: "")
    @Published var isShowingAlert: Bool = false
    @Published var isCreatedGame: Bool = false
    
    func createRoom() {
        FirebaseService.instance.createRoom(completion: { (code) in
            if code != "error" {
                self.isCreatedGame = true
            } else {
                self.isShowingAlert = true
                //TODO: - present error alert
            }
        })
    }
}
