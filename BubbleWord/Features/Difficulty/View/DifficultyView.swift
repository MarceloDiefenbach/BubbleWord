//
//  HomeView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

struct DifficultyView: View {
    
    // MARK: - Variables
    
    @ObservedObject private var viewModel: DifficultyViewModel = DifficultyViewModel()
    @State var isShowingEasyGame: Bool = false
    @State var isShowingMediumGame: Bool = false
    @State var isShowingHardGame: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text(viewModel.title)
                    .font(.system(size: FontSize.large.value, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, Spacing.small.value)
                    .padding(.top, -Spacing.large.value)
                
                CardComponent(title: Difficulty.easy.rawValue, subtitle: Difficulty.easy.difficultyDescription(), color: .appYellow)
                    .onTapGesture {
                        isShowingEasyGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingEasyGame, content: {
                        GameView(gameDifficulty: .easy, isShowing: $isShowingEasyGame)
                    })
                
                CardComponent(title: Difficulty.medium.rawValue, subtitle: Difficulty.medium.difficultyDescription(), color: .appRed)
                    .onTapGesture {
                        isShowingMediumGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingMediumGame, content: {
                        GameView(gameDifficulty: .medium, isShowing: $isShowingMediumGame)
                    })
                
                CardComponent(title: Difficulty.hard.rawValue, subtitle: Difficulty.hard.difficultyDescription(), color: .appBlue)
                    .onTapGesture {
                        isShowingHardGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingHardGame, content: {
                        GameView(gameDifficulty: .hard, isShowing: $isShowingHardGame)
                    })
                    .padding(.bottom, Spacing.xs.value)
            }
            
            VStack {
                Spacer()
                
                BannerAd(unitID: "ca-app-pub-7490663355066325/6944771661").frame(height: 50)
                    .padding(.bottom, Spacing.xxxs.value)
            }.ignoresSafeArea()
        }
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView()
    }
}
