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
    @State private var usernameField: String = ""
    
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
                
                LIOTextField(placeholder: viewModel.texfield, textField: $usernameField, textFieldType: .name)
                    .padding(.horizontal, Spacing.defaultMargin.value)
                    .padding(.bottom, Spacing.xxxs.value)
                    .onAppear() {
                        usernameField = UserDefaults.standard.string(forKey: "username") ?? ""
                    }
                    .onChange(of: usernameField, perform: { value in
                        UserDefaults.standard.set(value, forKey: "username")
                    })
                
                CardComponent(title: viewModel.createSessionButton, color: .appYellow, variant: .small)
                    .onTapGesture {
                        viewModel.createRoom()
                        FirebaseService.instance.isOwner = true
                    }
                    .onChange(of: viewModel.isCreatedGame, perform: { value in
                        if value == true {
                            isCreateViewShowing = true
                        }
                    })
                    .fullScreenCover(isPresented: $isCreateViewShowing, content: {
                        GameCoordinatorControl()
                    })
                
                CardComponent(title: viewModel.joinSessionButton, color: .appBlue, variant: .small)
                    .onTapGesture {
                        self.isJoinViewShowing = true
                        FirebaseService.instance.isOwner = false
                    }
                    .padding(.bottom, Spacing.xxs.value + 50)
            }
            
            VStack {
                Spacer()
                
                BannerAd(unitID: "ca-app-pub-7490663355066325/6944771661").frame(height: 50)
                    .padding(.bottom, Spacing.xxxs.value)
            }.ignoresSafeArea()
            
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
