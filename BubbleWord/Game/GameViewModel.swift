//
//  GameViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 10/11/22.
//

import Foundation

class GameViewModel: ObservableObject {
    
    //MARK: - texts
    var instruction = "Marque a letra inicial da\npalavra que você falou"
    
    @Published var letters: [Letter] = [
        Letter(letter: "A", state: .active, colorIndex: 1),
        Letter(letter: "B", state: .active, colorIndex: 2),
        Letter(letter: "C", state: .active, colorIndex: 3),
        Letter(letter: "D", state: .active, colorIndex: 1),
        Letter(letter: "E", state: .active, colorIndex: 2),
        Letter(letter: "F", state: .active, colorIndex: 3),
        Letter(letter: "G", state: .active, colorIndex: 1),
        Letter(letter: "H", state: .active, colorIndex: 2),
        Letter(letter: "I", state: .active, colorIndex: 1),
        Letter(letter: "J", state: .active, colorIndex: 2),
        Letter(letter: "K", state: .active, colorIndex: 3),
        Letter(letter: "L", state: .active, colorIndex: 1)
    ]
    @Published var flipped: Bool = false
    
    //MARK: - functions
    
    func turnInactiveLetter(index: Int) {
        if letters[index].state == .active {
            letters[index].state = .inactive
            timeRemaining = 30
        }
        
    }
    
    func oneSecondPassed() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        }
    }
    
    //MARK: time control
    
    @Published var timeRemaining = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
}
