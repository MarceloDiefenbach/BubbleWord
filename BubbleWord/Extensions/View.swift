//
//  RotateCard.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 10/11/22.
//

import SwiftUI

extension View {
    func flipRotate(_ degrees : Double) -> some View {
        return rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
    }
    
    func placedOnCard(_ color: Color) -> some View {
        return padding(5).frame(width: 250, height: 150, alignment: .center).background(color)
    }
    
    func hasNotch() -> Bool {
        let bottom = UIApplication.shared.windows.first{ $0.isKeyWindow }?.safeAreaInsets.bottom ?? 0
        if bottom == 0.0 {
            return true
        } else {
            return false
        }
    }
}
