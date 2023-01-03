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
                        Text(NSLocalizedString("continueButton", comment: ""))
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
                    
                    if RoomSettings.instance.isOwner {
                        HStack {
                            Text(NSLocalizedString("endButton", comment: ""))
                                .font(.system(size: FontSize.small.value, weight: .medium))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, Spacing.xxxs.value)
                                .padding(.vertical, Spacing.nano.value)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.5)
                        .cornerRadius(CornerRadius.circular.value)
                        .padding(.bottom, Spacing.xxs.value)
                        .onTapGesture {
                            finishGame()
                        }
                    } else {
                        //TODO: - add leave room button
                    }
                    
                    BannerAd(unitID: AdMobService.instance.pauseView)
                        .frame(height: 50)
                        .padding(.bottom, 80)
                        .padding(.top, 20)
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
