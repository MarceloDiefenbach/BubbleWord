//
//  GameViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 10/11/22.
//

import Foundation
import Combine

enum Difficulty: String {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
}

class GameViewModel: ObservableObject {
    
    // MARK: - Constants
    
    let instruction: String = "Marque a letra inicial da\npalavra que você falou."
    let easyDifficultyLetters: [Letter] = [
        Letter(letter: "A", state: .active, colorIndex: 1),
        Letter(letter: "B", state: .active, colorIndex: 2),
        Letter(letter: "C", state: .active, colorIndex: 3),
        Letter(letter: "D", state: .active, colorIndex: 1),
        Letter(letter: "E", state: .active, colorIndex: 2),
        Letter(letter: "F", state: .active, colorIndex: 3),
        Letter(letter: "G", state: .active, colorIndex: 1),
        Letter(letter: "L", state: .active, colorIndex: 1),
        Letter(letter: "M", state: .active, colorIndex: 1),
        Letter(letter: "N", state: .active, colorIndex: 2),
        Letter(letter: "O", state: .active, colorIndex: 3),
        Letter(letter: "P", state: .active, colorIndex: 1),
        Letter(letter: "R", state: .active, colorIndex: 3),
        Letter(letter: "S", state: .active, colorIndex: 1),
        Letter(letter: "T", state: .active, colorIndex: 2),
    ]
    let mediumDifficultyLetters: [Letter] = [
        Letter(letter: "H", state: .active, colorIndex: 2),
        Letter(letter: "I", state: .active, colorIndex: 1),
        Letter(letter: "J", state: .active, colorIndex: 2),
        Letter(letter: "Q", state: .active, colorIndex: 2),
        Letter(letter: "U", state: .active, colorIndex: 1),
        Letter(letter: "V", state: .active, colorIndex: 2),
    ]
    let hardDifficultyLetters: [Letter] = [
        Letter(letter: "K", state: .active, colorIndex: 3),
        Letter(letter: "X", state: .active, colorIndex: 3),
        Letter(letter: "Y", state: .active, colorIndex: 1),
        Letter(letter: "W", state: .active, colorIndex: 1),
        Letter(letter: "Z", state: .active, colorIndex: 2)
    ]
    let themePhraseList: [String] = [
        "Diga o nome de uma marca.",
        "Ofenda alguém.",
        "Diga o nome de uma profissão.",
        "O que acontece no russo.",
        "Diga uma marca de comida.",
        "Um aplicativo.",
        "Uma pessoa famosa."
    ]
    let initialTimeRemaining: Int = 10
    let timer: Publishers.Autoconnect<Timer.TimerPublisher> = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let gameDifficulty: Difficulty
    
    // MARK: - Variables
    
    @Published var timeRemaining: Int
    @Published var isStopped: Bool = false
    @Published var letters: [Letter] = []
    @Published var lose: Bool = false
    @Published var flipped: Bool = false
    @Published var cardPhrase: String = ""
    private var controlIfGameFinish: Int = 0
    
    // MARK: - Init
    
    public init(gameDifficulty: Difficulty) {
        self.gameDifficulty = gameDifficulty
        timeRemaining = initialTimeRemaining
        letters = generateNewSetOfLetters(difficulty: gameDifficulty, amount: 12)
        generateNewCardPhrase()
    }
    
    // MARK: - Functions
    
    func turnInactiveLetter(index: Int) {
        if letters[index].state == .active {
            letters[index].state = .inactive
            timeRemaining = initialTimeRemaining
            controlIfGameFinish += 1
        }
        
        if controlIfGameFinish == 12 {
            controlIfGameFinish = 0
            letters = generateNewSetOfLetters(difficulty: gameDifficulty, amount: 12)
            changeCard()
        }
    }
    
    func changeCard() {
        flipped.toggle()
        generateNewCardPhrase()
    }
    
    private func generateNewCardPhrase() {
        cardPhrase = themePhraseList.randomElement() ?? "Erro ao carregar um tema."
    }
    
    func generateNewSetOfLetters(difficulty: Difficulty, amount: Int) -> [Letter] {

        var letterListToDraw: [Letter] = []
        
        switch difficulty {
        case .easy:
            letterListToDraw += easyDifficultyLetters
        
        case .medium:
            letterListToDraw += easyDifficultyLetters
            letterListToDraw += mediumDifficultyLetters
            
        case .hard:
            letterListToDraw += easyDifficultyLetters
            letterListToDraw += mediumDifficultyLetters
            letterListToDraw += hardDifficultyLetters
        }
        
        letterListToDraw.shuffle()
        
        return Array(letterListToDraw[0...amount-1]).sorted { lhs, rhs in
            lhs.letter < rhs.letter
        }
    }
    
    func oneSecondPassed() {
        if timeRemaining == 0 {
            lose = true
        } else {
            if timeRemaining > 0 {
                if !isStopped {
                    timeRemaining -= 1
                }
            }
        }
    }
    
    func nextParticipant() {
        lose = false
        timeRemaining = initialTimeRemaining
    }
    
}
