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
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 40)
                
                ButtonComponent(title: Difficulty.easy.rawValue, color: .appYellow)
                    .onTapGesture {
                        isShowingEasyGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingEasyGame, content: {
                        GameView(gameDifficulty: .easy, isShowing: $isShowingEasyGame)
                    })
                
                ButtonComponent(title: Difficulty.medium.rawValue, color: .appRed)
                    .onTapGesture {
                        isShowingMediumGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingMediumGame, content: {
                        GameView(gameDifficulty: .medium, isShowing: $isShowingMediumGame)
                    })
                
                ButtonComponent(title: Difficulty.hard.rawValue, color: .appBlue)
                    .onTapGesture {
                        isShowingHardGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingHardGame, content: {
                        GameView(gameDifficulty: .hard, isShowing: $isShowingHardGame)
                    })
                    .padding(.bottom, 30)
            }
            VStack {
                Spacer()
                BannerAd(unitID: "ca-app-pub-7490663355066325/6944771661").frame(height: 50)
                    .padding(.bottom, 15)
            }
        }
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView()
    }
}
