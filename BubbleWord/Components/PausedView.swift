//
//  PausedView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

struct PausedView: View {
    
    // MARK: - Variables
    
    var playGame: () -> Void
    var finishGame: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9).ignoresSafeArea()
            
            ZStack {
                VStack(spacing: 24) {
                    Spacer()
                    
                    HStack {
                        Text("Continue game")
                            .font(.system(size: FontSize.small.value, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, Spacing.xxxs.value)
                            .padding(.vertical, Spacing.nano.value)
                    }
                    .background(Color.white)
                    .cornerRadius(CornerRadius.circular.value)
                    .onTapGesture {
                        playGame()
                    }
                    
                    HStack {
                        Text("Finish game")
                            .font(.system(size: FontSize.small.value, weight: .medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, Spacing.xxxs.value)
                            .padding(.vertical, Spacing.nano.value)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.5)
                    .cornerRadius(CornerRadius.circular.value)
                    .padding(.bottom, Spacing.xxs.value)
                    .onTapGesture {
                        finishGame()
                    }
                    
                    BannerAd(unitID: "ca-app-pub-7490663355066325/4238717274").frame(height: 50)
                        .padding(.bottom, 80)
                }
            }
        }
    }
}

struct PausedView_Previews: PreviewProvider {
    static var previews: some View {
        PausedView(playGame: {}, finishGame: {})
    }
}
