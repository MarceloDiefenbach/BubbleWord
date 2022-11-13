//
//  HomeView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    @State var isShowingCasualGame: Bool = false
    
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
                
                CategoryComponent(title: viewModel.casualName, BWColor: .yellow)
                    .onTapGesture {
                        isShowingCasualGame = true
                    }
                    .fullScreenCover(isPresented: $isShowingCasualGame, content: {
                        GameView()
                    })
                
                CategoryComponent(title: viewModel.casualName, BWColor: .red)
                
                CategoryComponent(title: viewModel.casualName, BWColor: .blue)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
