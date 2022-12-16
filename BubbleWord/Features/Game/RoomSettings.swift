//
//  RoomSettings.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/12/22.
//

import Foundation

class RoomSettings {
    
    static var instance: RoomSettings = RoomSettings()
    
    var isOnline: Bool = false
    var isMyTimeToPlay: Bool = true
    var isOwner: Bool = true

}
