//
//  HomeViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    // MARK: - Constants

    let title: String = "Escolha uma tema e comece a jogar"
    let casual: [String] = [
        "Marcas de carro",
        "Nome de cidade, estado ou país",
        "Marcas de roupas",
    ]
}
