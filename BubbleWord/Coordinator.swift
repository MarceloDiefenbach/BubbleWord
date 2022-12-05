//
//  Coordinator.swift
//  JumpingBall
//
//  Created by Marcelo Diefenbach on 15/11/22.
//

import Foundation

enum PresentingViews {
    case createGameView, difficultySelector, playGame, multiplayerView, joinGameView, waintingRoom;
}

class Coordinator: ObservableObject {
    
    @Published var isPresentingView: PresentingViews = .createGameView
    
}
