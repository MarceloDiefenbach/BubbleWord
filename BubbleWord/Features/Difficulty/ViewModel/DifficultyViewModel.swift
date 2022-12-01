//
//  HomeViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import Foundation

class DifficultyViewModel: ObservableObject {
    
    // MARK: - Constants

    let title: String = NSLocalizedString("difficultyTitle", comment: "")
    let casual: [String] = [
        "Car brands",
        "City",
        "State",
        "Country",
        "Clothes brands",
        "Profession",
        "Animal",
        "Food",
        "Bathroom things",
        "Insults"
    ]
    
    //MARK: - difficulties labels
    let easyTitle: String = Difficulty.easy.title()
    let mediumTitle: String = Difficulty.medium.title()
    let hardTitle: String = Difficulty.hard.title()
    let easyDescription: String = Difficulty.easy.difficultyDescription()
    let mediumDescription: String = Difficulty.medium.difficultyDescription()
    let hardDescription: String = Difficulty.hard.difficultyDescription()
    
}
