//
//  Coordinator.swift
//  JumpingBall
//
//  Created by Marcelo Diefenbach on 15/11/22.
//

import Foundation

enum PresentingViewsGameCoordinator {
    case createGameView, difficultySelector, playGame, multiplayerView, joinGameView, waintingRoom;
}

class GameCoordinator: ObservableObject {
    
    @Published var isPresentingView: PresentingViewsGameCoordinator = .createGameView
    
}
