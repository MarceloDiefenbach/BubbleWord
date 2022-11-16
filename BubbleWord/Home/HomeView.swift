//
//  HomeView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel: HomeViewModel = HomeViewModel()
    
    @State var isShowingEasyGame: Bool = false
    @State var isShowingMediumGame: Bool = false
    @State var isShowingHardGame: Bool = false
    
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
                
                CategoryComponent(title: Difficulty.easy.rawValue, BWColor: .yellow)
                    .onTapGesture {
                        isShowingEasyGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingEasyGame, content: {
                        GameView(gameDifficulty: .easy, isShowing: $isShowingEasyGame)
                    })
                
                CategoryComponent(title: Difficulty.medium.rawValue, BWColor: .red)
                    .onTapGesture {
                        isShowingMediumGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingMediumGame, content: {
                        GameView(gameDifficulty: .medium, isShowing: $isShowingMediumGame)
                    })
                
                CategoryComponent(title: Difficulty.hard.rawValue, BWColor: .blue)
                    .onTapGesture {
                        isShowingHardGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingHardGame, content: {
                        GameView(gameDifficulty: .hard, isShowing: $isShowingHardGame)
                    })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
