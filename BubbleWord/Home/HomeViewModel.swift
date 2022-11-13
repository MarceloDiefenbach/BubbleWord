//
//  HomeViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    //MARK: - texts

    var title = "Escolha uma tema e comece a jogar"
    
    
    //MARK: - categories packs

    var casualName = "Casual"
    var casual: [String] = [
        "Marcas de carro",
        "Nome de cidade, estado ou país",
        "Marcas de roupas",
    ]
    
}
