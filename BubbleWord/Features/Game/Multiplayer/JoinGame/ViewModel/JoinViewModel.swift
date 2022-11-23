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
    
    @Published var title: String = "Join Game"
    @Published var placeholder: String = "Type room code here"
    @Published var buttonLabel: String = "Join Game"
    
    func joinGame(roomCode: String, completionHandler: @escaping (JoinStatus) -> Void) {
        
        //TODO: - logic to join a game
        //TODO: - test if roomCode is valid and not nil
        
        completionHandler(JoinStatus.success) // here return succes only for test
        
    }
    
}
