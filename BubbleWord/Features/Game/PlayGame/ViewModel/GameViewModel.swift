//
//  GameViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 10/11/22.
//

import Foundation
import Combine
import SwiftUI

enum Difficulty: String {
    case easy
    case medium
    case hard
    
    func title() -> String {
        switch self {
        case .easy:
            return NSLocalizedString("easy", comment: "")
        case .medium:
            return NSLocalizedString("medium", comment: "")
        case .hard:
            return NSLocalizedString("hard", comment: "")
        }
    }
    
    func difficultyDescription() -> String {
        switch self {
        case .easy:
            return NSLocalizedString("easyDescription", comment: "")
        case .medium:
            return NSLocalizedString("mediumDescription", comment: "")
        case .hard:
            return NSLocalizedString("hardDescription", comment: "")
        }
    }
}

class GameViewModel: ObservableObject {
    
    // MARK: - Constants
    
    let easyDifficultyLetters: [Letter] = [
        Letter(letter: "A", state: true, colorIndex: 1),
        Letter(letter: "B", state: true, colorIndex: 2),
        Letter(letter: "C", state: true, colorIndex: 3),
        Letter(letter: "D", state: true, colorIndex: 1),
        Letter(letter: "E", state: true, colorIndex: 2),
        Letter(letter: "F", state: true, colorIndex: 3),
        Letter(letter: "G", state: true, colorIndex: 1),
        Letter(letter: "L", state: true, colorIndex: 1),
        Letter(letter: "M", state: true, colorIndex: 1),
        Letter(letter: "N", state: true, colorIndex: 2),
        Letter(letter: "O", state: true, colorIndex: 3),
        Letter(letter: "P", state: true, colorIndex: 1),
        Letter(letter: "R", state: true, colorIndex: 3),
        Letter(letter: "S", state: true, colorIndex: 1),
        Letter(letter: "T", state: true, colorIndex: 2),
    ]
    let mediumDifficultyLetters: [Letter] = [
        Letter(letter: "H", state: true, colorIndex: 2),
        Letter(letter: "I", state: true, colorIndex: 1),
        Letter(letter: "J", state: true, colorIndex: 2),
        Letter(letter: "Q", state: true, colorIndex: 2),
        Letter(letter: "U", state: true, colorIndex: 1),
        Letter(letter: "V", state: true, colorIndex: 2),
    ]
    let hardDifficultyLetters: [Letter] = [
        Letter(letter: "K", state: true, colorIndex: 3),
        Letter(letter: "X", state: true, colorIndex: 3),
        Letter(letter: "Y", state: true, colorIndex: 1),
        Letter(letter: "W", state: true, colorIndex: 1),
        Letter(letter: "Z", state: true, colorIndex: 2)
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
        "Things young people hate",
        "Occasions to wear your lucky underwear",
        "Name something that can to be Licked ",
        "Name an activity that requires using your lips",
        "Other ways to say penis",
        "Other ways to say vagina",
        "Phrases you can say at work and in bed",
        "Ways to become a millionaire",
        "Words that don't have A",
        "Name adjectives of a bad boss",
        "Name red flags on a dating site"
    ]
    
    let initialTimeRemaining: Int = 10
    let timer: Publishers.Autoconnect<Timer.TimerPublisher> = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let gameDifficulty: Difficulty
    
    // MARK: - Variables
    
    @Published var timeRemaining: Int
    @Published var timeRemainingShowOnView: Int = 0
    @Published var isStopped: Bool = false
    @Published var letters: [Letter] = []
    @Published var lose: Bool = false
    @Published var flipped: Bool = false
    @Published var cardPhrase: String = ""
    @Published var currentPlayer: String = NSLocalizedString("currentPlayer", comment: "")
    @Published var nextPlayer: String = ""
    private var cardPhraseIndex: Int = 0
    private var controlIfGameFinish: Int = 0
    
    // MARK: - Init
    
    public init() {
        let difficultyDefaults: String = UserDefaults.standard.string(forKey: "difficulty") ?? ""
        
        if difficultyDefaults == "easy" {
            self.gameDifficulty = .easy
        } else if difficultyDefaults == "medium" {
            self.gameDifficulty = .medium
        } else {
            self.gameDifficulty = .hard
        }
        timeRemaining = initialTimeRemaining
        shuffleThemePhraseList()
        generateNewCardPhrase()
        
        let internletters = generateNewSetOfLetters(difficulty: gameDifficulty, amount: 12)
        
        if RoomSettings.instance.isOnline {
            
            FirebaseService.instance.getTimeRemaining(completion: {(response) in
                self.timeRemainingShowOnView = response
            })
            
            FirebaseService.instance.getLetters(completion: {(response) in
                self.letters = response
            })
            
            FirebaseService.instance.isStoped(completion: {(response) in
                if response == true {
                    self.isStopped = true
                } else {
                    self.isStopped = false
                }
            })
            
            FirebaseService.instance.getActualTheme(completion: {(actualTheme) in
                self.cardPhrase = actualTheme
            })
            
        } else {
            letters = internletters
            self.timeRemainingShowOnView = self.timeRemaining
        }
    }
    
    // MARK: - Functions
    
    func turnInactiveLetter(index: Int) {
        if letters[index].state == true {
            letters[index].state = false
            timeRemaining = initialTimeRemaining
            controlIfGameFinish += 1
            
            if RoomSettings.instance.isOnline {
                FirebaseService.instance.markLetterAsUded(letters[index])
            } else {
                letters[index].state = false
            }
        }
        
        if controlIfGameFinish == 12 {
            controlIfGameFinish = 0
            let internLetters = generateNewSetOfLetters(difficulty: gameDifficulty, amount: 12)
            
            if RoomSettings.instance.isOnline {
                FirebaseService.instance.getLetters(completion: {(response) in
                    self.letters = response
                })
            } else {
                self.letters = internLetters
            }
            self.changeCard()
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
        if RoomSettings.instance.isOnline {
            FirebaseService.instance.changeActualTheme(theme: themePhraseList[cardPhraseIndex])
        } else {
            cardPhrase = themePhraseList[cardPhraseIndex]
        }
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
        
        let array = Array(letterListToDraw[0...amount-1]).sorted { lhs, rhs in
            lhs.letter < rhs.letter
        }
        
        if RoomSettings.instance.isOnline {
            
            FirebaseService.instance.saveLetters(letters: array)
            
            print(letters)
        }
        
        return array
    }
    
    func oneSecondPassed() {
        if timeRemaining == 0 {
            lose = true
        } else {
            if timeRemaining > 0 {
                if !isStopped {
                    timeRemaining -= 1
                    if RoomSettings.instance.isOnline {
                        FirebaseService.instance.updateTimeRemaining(time: timeRemaining)
                    }
                }
            }
        }
    }
    
    func nextParticipant() {
        lose = false
        timeRemaining = initialTimeRemaining
    }
    
    func stopGame() {
        if RoomSettings.instance.isOnline {
            FirebaseService.instance.stopGame()
        } else {
            isStopped = true
        }
    }
    
    func resumeGame() {
        if RoomSettings.instance.isOnline {
            FirebaseService.instance.resumeGame()
        } else {
            isStopped = false
        }
    }
    
    func startGame() {
        if RoomSettings.instance.isOnline {
            FirebaseService.instance.startGame()
        }
    }
    
    func finishGame() {
        if RoomSettings.instance.isOnline {
            FirebaseService.instance.deleteRoom(completion: {(response) in
                //TODO: - here we need to use the response to show alert if error ocurred
            })
        } else {
            isStopped = false
        }
    }
    
}
