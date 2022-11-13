//
//  HomeView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var isShowingCasualGame: Bool = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("Escolha uma tema e comece a jogar")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 40)
                CategoryComponent(BWColor: .yellow)
                    .onTapGesture {
                        isShowingCasualGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingCasualGame, content: {
                        GameView()
                    })
                CategoryComponent(BWColor: .red)
                CategoryComponent(BWColor: .blue)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
