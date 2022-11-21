//
//  HowToPLay.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 20/11/22.
//

import SwiftUI

struct HowToPlay: View {
    var body: some View {
        ZStack {
            Color.appRed.ignoresSafeArea()
            VStack {

                Text("Here's how to play:")
                    .font(.system(size: FontSize.large.value, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, Spacing.large.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                Text("You will have 10 seconds to say of a word matching the theme and beginning with any of the letters available in the poll of letters")
                    .font(.system(size: FontSize.xs.value, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, Spacing.xxxs.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                Text("After spell the word, tap the letter to switch to next participant")
                    .font(.system(size: FontSize.xs.value, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding(.horizontal, Spacing.defaultMargin.value)
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}
