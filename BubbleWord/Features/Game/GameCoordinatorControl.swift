//
//  GameCoordinatorControl.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 05/12/22.
//

import SwiftUI

struct GameCoordinatorControl: View {
    
    @StateObject private var coordinator: Coordinator = Coordinator()
    
    var body: some View {
        if coordinator.isPresentingView == .createGameView {
            CreateGameView()
                .environmentObject(coordinator)
        } else if coordinator.isPresentingView == .playGame {
            DifficultyView()
                .environmentObject(coordinator)
        }
    }
}

struct GameCoordinatorControl_Previews: PreviewProvider {
    static var previews: some View {
        GameCoordinatorControl()
    }
}
