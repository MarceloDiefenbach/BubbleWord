//
//  JoinGame.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 22/11/22.
//

import SwiftUI

struct MultiplayerView: View {
    
    @ObservedObject private var viewModel: MultiplayerViewModel = MultiplayerViewModel()
    
    @State private var isCreateViewShowing: Bool = false
    @State private var isJoinViewShowing: Bool = false
    @State private var textField: String = UserDefaults.standard.string(forKey: "username") ?? ""
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text(viewModel.title)
                    .font(.system(size: FontSize.extraLarge.value, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, Spacing.xxs.value)
                
                LIOTextField(placeholder: viewModel.texfield, textField: $textField, textFieldType: .name)
                    .padding(.horizontal, Spacing.defaultMargin.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                CardComponent(title: viewModel.createSessionButton, color: .appYellow, variant: .small)
                    .onTapGesture {
                        self.isCreateViewShowing = true
                    }
                
                CardComponent(title: viewModel.joinSessionButton, color: .appBlue, variant: .small)
                    .onTapGesture {
                        self.isJoinViewShowing = true
                    }
                    .padding(.bottom, Spacing.xxs.value + 50)
            }
            
            VStack {
                Spacer()
                
                BannerAd(unitID: "ca-app-pub-7490663355066325/6944771661").frame(height: 50)
                    .padding(.bottom, Spacing.xxxs.value)
            }.ignoresSafeArea()
            
            NavigationLink("", isActive: $isCreateViewShowing) {
                CreateGameView()
            }.hidden()
            
            NavigationLink("", isActive: $isJoinViewShowing) {
                JoinView()
            }.hidden()
        }
    }
}

struct JoinGame_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerView()
    }
}
