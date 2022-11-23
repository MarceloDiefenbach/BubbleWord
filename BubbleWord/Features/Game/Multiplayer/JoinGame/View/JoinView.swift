//
//  JoinView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 22/11/22.
//

import SwiftUI

struct JoinView: View {
    
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
                
                Text("Join game")
                    .font(.system(size: FontSize.extraLarge.value, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, Spacing.xxs.value)
                
                Text("Room code")
                    .font(.system(size: FontSize.small.value, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.bottom, Spacing.nano.value)
                
                LIOTextField(placeholder: "Type room code here", textField: $textField, textFieldType: .name)
                    .padding(.horizontal, Spacing.defaultMargin.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                CardComponent(title: "Join game", color: .appYellow, variant: .small)
                    .onTapGesture {
                        //TODO: - go to waiting view
                    }
                    .padding(.bottom, Spacing.xxxs.value)
                
            }
            
            VStack {
                Spacer()
                
                BannerAd(unitID: "ca-app-pub-7490663355066325/6944771661").frame(height: 50)
                    .padding(.bottom, Spacing.xxxs.value)
            }.ignoresSafeArea()
        }
    }

}

struct JoinView_Previews: PreviewProvider {
    static var previews: some View {
        JoinView()
    }
}
