//
//  JoinViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 23/11/22.
//

import Foundation

enum JoinStatus {
    case success, failed, waiting
}

class JoinViewModel: ObservableObject {
    
    // MARK: - Variables

    @Published var title: String = NSLocalizedString("joinRoomTitle", comment: "")
    @Published var placeholder: String = NSLocalizedString("joinRoomField", comment: "")
    @Published var buttonLabel: String = NSLocalizedString("joinRoomButton", comment: "")

    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - Functions
    
    func joinGame(roomCode code: String, completion: @escaping (JoinStatus) -> Void) {
        FirebaseService.instance.joinRoom(code: code) { result in
            switch result {
            case .success(_):
                completion(.success)
            case .failure(let failure):
                print(failure.localizedDescription)
                completion(.failed)
            }
        }
    }
}
