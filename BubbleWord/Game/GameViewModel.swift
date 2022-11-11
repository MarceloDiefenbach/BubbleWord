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
    
    //MARK: - variables
    
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
    private var controlIfGameFinish: Int = 0
    
    //MARK: - functions
    
    func turnInactiveLetter(index: Int) {
        if letters[index].state == .active {
            letters[index].state = .inactive
            timeRemaining = 30
            controlIfGameFinish += 1
        }
        
        if controlIfGameFinish == 12 {
            controlIfGameFinish = 0
            generateNewSetOfLetters()
            changeCard()
            
        }
    }
    
    func changeCard() {
        //TODO: - logic to change card label and color
        flipped.toggle()
    }
    
    func generateNewSetOfLetters() {
        
        //TODO: -  provavelmente deve ter uma forma de fazer isso melhor
        
        let randomInt = Int.random(in: 1 ... 3)
        
        if randomInt == 1 {
            letters = [
                Letter(letter: "T", state: .active, colorIndex: 1),
                Letter(letter: "P", state: .active, colorIndex: 2),
                Letter(letter: "A", state: .active, colorIndex: 3),
                Letter(letter: "F", state: .active, colorIndex: 1),
                Letter(letter: "R", state: .active, colorIndex: 2),
                Letter(letter: "Z", state: .active, colorIndex: 3),
                Letter(letter: "F", state: .active, colorIndex: 1),
                Letter(letter: "J", state: .active, colorIndex: 2),
                Letter(letter: "L", state: .active, colorIndex: 1),
                Letter(letter: "Q", state: .active, colorIndex: 2),
                Letter(letter: "W", state: .active, colorIndex: 3),
                Letter(letter: "O", state: .active, colorIndex: 1)
            ]
        } else if randomInt == 2 {
            letters = [
                Letter(letter: "D", state: .active, colorIndex: 1),
                Letter(letter: "I", state: .active, colorIndex: 2),
                Letter(letter: "G", state: .active, colorIndex: 3),
                Letter(letter: "T", state: .active, colorIndex: 1),
                Letter(letter: "Q", state: .active, colorIndex: 2),
                Letter(letter: "L", state: .active, colorIndex: 3),
                Letter(letter: "K", state: .active, colorIndex: 1),
                Letter(letter: "X", state: .active, colorIndex: 2),
                Letter(letter: "U", state: .active, colorIndex: 1),
                Letter(letter: "J", state: .active, colorIndex: 2),
                Letter(letter: "A", state: .active, colorIndex: 3),
                Letter(letter: "O", state: .active, colorIndex: 1)
            ]
        } else if randomInt == 3 {
            letters = [
                Letter(letter: "A", state: .active, colorIndex: 1),
                Letter(letter: "M", state: .active, colorIndex: 2),
                Letter(letter: "D", state: .active, colorIndex: 3),
                Letter(letter: "R", state: .active, colorIndex: 1),
                Letter(letter: "K", state: .active, colorIndex: 2),
                Letter(letter: "W", state: .active, colorIndex: 3),
                Letter(letter: "P", state: .active, colorIndex: 1),
                Letter(letter: "O", state: .active, colorIndex: 2),
                Letter(letter: "I", state: .active, colorIndex: 1),
                Letter(letter: "V", state: .active, colorIndex: 2),
                Letter(letter: "S", state: .active, colorIndex: 3),
                Letter(letter: "M", state: .active, colorIndex: 1)
            ]
        }
    }
    
    //MARK: - time control
    
    @Published var timeRemaining = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func oneSecondPassed() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        }
    }
    
}
