//
//  JoinGame.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 22/11/22.
//

import SwiftUI

struct MultiplayerView: View {
    
    @State private var isCreateViewShowing: Bool = false
    @State private var textField: String = ""
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
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
                        //TODO: - open joinView
                    }
                
                NavigationLink("", isActive: $isCreateViewShowing) {
                    CreateGameSession(inviteCode: "ABCDE")
                }.hidden()
            }
        }
    }
}

struct JoinGame_Previews: PreviewProvider {
    static var previews: some View {
        MultiplayerView()
    }
}
