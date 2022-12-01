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
    
    @Published var title: String = "Join Game"
    @Published var placeholder: String = "Type room code here"
    @Published var buttonLabel: String = "Join Game"
    var firebase: FirebaseService = FirebaseService()
    
    // MARK: - Init
    
    init() {
        
    }
    
    // MARK: - Functions
    
    func joinGame(roomCode code: String, completion: @escaping (JoinStatus) -> Void) {
        self.firebase.joinRoom(code: code) { result in
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
