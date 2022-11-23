//
//  JoinGame.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 22/11/22.
//

import SwiftUI

struct MultiplayerView: View {
    
    @State private var isCreateViewShowing: Bool = false
    @State private var isJoinViewShowing: Bool = false
    @State private var textField: String = ""
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                BannerAd(unitID: "ca-app-pub-7490663355066325/6944771661").frame(height: 50)
                    .padding(.bottom, Spacing.xxxs.value)
                
                Spacer()
                
                Text("Multiplayer")
                    .font(.system(size: FontSize.extraLarge.value, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, Spacing.xxs.value)
                
                Text("What's your name?")
                    .font(.system(size: FontSize.small.value, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.bottom, Spacing.nano.value)
                
                LIOTextField(placeholder: "Type your name here", textField: $textField, textFieldType: .name)
                    .padding(.horizontal, Spacing.defaultMargin.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                CardComponent(title: "Create session", color: .appYellow)
                    .onTapGesture {
                        self.isCreateViewShowing = true
                    }
                
                CardComponent(title: "Join session", color: .appBlue)
                    .onTapGesture {
                        self.isJoinViewShowing = true
                    }
                    .padding(.bottom, Spacing.xxxs.value)
            }
            
            NavigationLink("", isActive: $isCreateViewShowing) {
                CreateGameSession(inviteCode: "ABCDE")
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
