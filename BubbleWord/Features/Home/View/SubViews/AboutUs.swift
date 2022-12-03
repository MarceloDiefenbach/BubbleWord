//
//  AboutUs.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 20/11/22.
//

import SwiftUI

struct AboutUs: View {
    var body: some View {
        ZStack {
            Color.appRed.ignoresSafeArea()
            VStack {
                
                Text(NSLocalizedString("aboutUsTitle", comment: ""))
                    .font(.system(size: FontSize.large.value, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, Spacing.large.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                Text("Annderson Oreto")
                    .font(.system(size: FontSize.xs.value, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.top, Spacing.xxxs.value)
                
                Text("Marcelo Diefenbach")
                    .font(.system(size: FontSize.xs.value, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                    .padding(.vertical, Spacing.xs.value)
                
                Text(NSLocalizedString("contactViaEmail", comment: ""))
                    .font(.system(size: FontSize.xs.value, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, Spacing.nano.value)
                
                Text("anndersonp@gmail.com")
                    .font(.system(size: FontSize.xs.value, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, Spacing.xxxs.value)
                
                Spacer()
            }
            .padding(.horizontal, Spacing.defaultMargin.value)
        }
    }
}

struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
