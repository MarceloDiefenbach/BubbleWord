//
//  InviteLetterComponent.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 21/11/22.
//

import SwiftUI

enum LetterType {
    case input, onlyView
}

struct InviteLetterComponent: View {
    
    @State var letter: String?
    @State var variant: LetterType
    
    var body: some View {
        ZStack {
            
            if variant == LetterType.onlyView {
                Color.appRed
            } else {
                Color.appBlue
            }
            
            Text(letter?.uppercased() ?? "A")
                .font(.system(size: FontSize.large.value, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Spacing.xxxs.value)
                .padding(.vertical, Spacing.nano.value)
        }.cornerRadius(CornerRadius.small.value)
    }
}

struct InviteLetterComponent_Previews: PreviewProvider {
    static var previews: some View {
        InviteLetterComponent(variant: .onlyView)
    }
}
