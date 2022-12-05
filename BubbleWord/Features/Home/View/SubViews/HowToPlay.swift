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

                Text(NSLocalizedString("howToPlayTitle", comment: ""))
                    .font(.system(size: FontSize.large.value, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, Spacing.large.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                Text(NSLocalizedString("howToPlayDescription1", comment: ""))
                    .font(.system(size: FontSize.xs.value, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, Spacing.xxxs.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                Text(NSLocalizedString("howToPlayDescription2", comment: ""))
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
