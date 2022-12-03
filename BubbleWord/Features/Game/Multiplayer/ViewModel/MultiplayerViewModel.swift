//
//  MultiplayerViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 03/12/22.
//

import Foundation

class MultiplayerViewModel: ObservableObject {

    // MARK: - Variables
    
    @Published var title = NSLocalizedString("multiplayerTitle", comment: "")
    @Published var texfield = NSLocalizedString("multiplayerField", comment: "")
    @Published var createSessionButton = NSLocalizedString("createSessionButton", comment: "")
    @Published var joinSessionButton = NSLocalizedString("joinSessionButton", comment: "")

}
