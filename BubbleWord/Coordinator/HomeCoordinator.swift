//
//  HomeCoordinator.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 06/12/22.
//

import Foundation

enum PresentingViewsHomeCoordinator {
    case home, waitingRoom, playSinglePlayer, playMultiplayer
}

class HomeCoordinator: ObservableObject {
    
    @Published var isPresentingView: PresentingViewsHomeCoordinator = .home
    
}
