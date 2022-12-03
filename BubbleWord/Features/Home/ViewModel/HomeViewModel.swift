//
//  HomeViewModel.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 03/12/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    //MARK: - Constants
    
    @Published var title = "Letters.io"
    @Published var singleDeviceTitle = NSLocalizedString("singleDeviceTitle", comment: "")
    @Published var singleDeviceDescription = NSLocalizedString("singleDeviceDescription", comment: "")
    @Published var multiplayerTitle = NSLocalizedString("multiplayerTitle", comment: "")
    @Published var multiplayerDescription = NSLocalizedString("multiplayerDescription", comment: "")
    @Published var howToPlayButton = NSLocalizedString("howToPlayButton", comment: "")
    @Published var howToPlayIcon = "questionmark.circle"
    @Published var storeButton = NSLocalizedString("storeButton", comment: "")
    @Published var storeIcon = "gearshape"
    @Published var settingsTitle = NSLocalizedString("settingsTitle", comment: "")
    @Published var settingsIcon = "gearshape"
    
}
