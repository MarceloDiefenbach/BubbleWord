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
    var themePhraseList: [String] = [
        "Car brand",
        "City",
        "State",
        "Country",
        "Clothing brand",
        "Profession",
        "Animal",
        "Food",
        "Bathroom things",
        "Insults",
        "Things happen at Russo",
        "An app name",
        "Famous",
        "Sports",
        "Things that exist in space",
        "Places",
        "What to do on summer",
        "Things you cry for",
        "Dog names",
        "Places for someone to study",
        "Reason to celebrate with a party",
        "Something you always find two of",
        "Kids birthday food",
        "Soccer team",
        "Cartoon characters",
        "Disney characters",
        "Baby things",
        "Things that shouldn't exist",
        "Things people hide",
        "Things you can't take on a plane",
        "TV series",
        "Celebrities who died young",
        "Things that kill",
        "Things that cause fights",
        "What do you think about when you brush your teeth?",
        "The worst name for a dog",
        "Snacks do you usually eat at the movies",
        "Things you stop doing as you grow older?",
        "Things adults hate",
        "Things young people hate"
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
    @Published var currentPlayer: String = "Your turn"
    @Published var nextPlayer: String = "Next player: Fulano"
    private var cardPhraseIndex: Int = 0
    private var controlIfGameFinish: Int = 0
    
    // MARK: - Init
    
    public init(gameDifficulty: Difficulty) {
        self.gameDifficulty = gameDifficulty
        timeRemaining = initialTimeRemaining
        shuffleThemePhraseList()
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
    
    private func shuffleThemePhraseList() {
        self.themePhraseList.shuffle()
    }
    
    private func generateNewCardPhrase() {
        if cardPhraseIndex >= themePhraseList.count { cardPhraseIndex = 0 }
        cardPhrase = themePhraseList[cardPhraseIndex]
        cardPhraseIndex += 1
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
