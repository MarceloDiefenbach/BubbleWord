//
//  JoinGame.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 22/11/22.
//

import SwiftUI

struct JoinGame: View {
    
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
                    .padding(.bottom, Spacing.nano.value)
                
                HStack {
                    TextField("", text: self.$textField)
                        .font(.system(size: FontSize.small.value, weight: .bold))
                        .disableAutocorrection(true)
                        .textContentType(.username)
                        .multilineTextAlignment(.center)
                        .placeholder(when: textField.isEmpty) {
                            Text("Insert your name here")
                                .multilineTextAlignment(.center)
                                .font(.system(size: FontSize.small.value, weight: .regular))
                                .foregroundColor(.white)
                        }
                        .keyboardType(UIKeyboardType.default)
                        .autocapitalization(.none)
                        .padding(.vertical, Spacing.xxxs.value)
                        .onChange(of: textField) { newValue in
                            UserDefaults.standard.set(newValue, forKey: "username")
                        }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: CornerRadius.small.value)
                        .stroke(.white, lineWidth: 1)
                )
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
        JoinGame()
    }
}
