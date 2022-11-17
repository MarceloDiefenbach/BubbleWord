//
//  HomeViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    // MARK: - Constants

    let title: String = "Choose a\ndifficulty to play"
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
}
