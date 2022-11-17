//
//  PausedView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

struct PausedView: View {
    
    var playGame: () -> Void
    var finishGame: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9).ignoresSafeArea()
            ZStack {
                VStack(spacing: 24) {
                    Spacer()
                    HStack {
                        Text("Continue game")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                    .background(Color.white)
                    .cornerRadius(50)
                    .onTapGesture {
                        playGame()
                    }
                    
                    HStack {
                        Text("Finish game")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.5)
                    .cornerRadius(50)
                    .padding(.bottom, 24)
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
