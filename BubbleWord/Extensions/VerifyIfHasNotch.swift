//
//  VerifyIfHasNotch.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 17/11/22.
//

import SwiftUI

extension View {
    
    func hasNotch() -> Bool {
        let bottom = UIApplication.shared.windows.first{ $0.isKeyWindow }?.safeAreaInsets.bottom ?? 0
        if bottom == 0.0 {
            return true
        } else {
            return false
        }
    }

}
