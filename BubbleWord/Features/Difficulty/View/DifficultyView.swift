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
    @EnvironmentObject var coordinator: GameCoordinator //maybe isnt used
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    
    @State var isShowingGame: Bool = false

    
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
                
                CardComponent(title: viewModel.easyTitle, subtitle: viewModel.easyDescription, color: .appYellow)
                    .onTapGesture {
                        UserDefaults.standard.set("easy", forKey: "difficulty")
                        self.homeCoordinator.isPresentingView = .play
                    }
                
                CardComponent(title: viewModel.mediumTitle, subtitle: viewModel.mediumDescription, color: .appRed)
                    .onTapGesture {
                        UserDefaults.standard.set("medium", forKey: "difficulty")
                        self.homeCoordinator.isPresentingView = .play
                    }
                
                CardComponent(title: viewModel.hardTitle, subtitle: viewModel.hardDescription, color: .appBlue)
                    .onTapGesture {
                        UserDefaults.standard.set("hard", forKey: "difficulty")
                        self.homeCoordinator.isPresentingView = .play
                    }
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
