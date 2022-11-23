//
//  JoinView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 22/11/22.
//

import SwiftUI

struct JoinView: View {
    
    @ObservedObject private var viewModel: JoinViewModel = JoinViewModel()
    
    @State private var textField: String = ""
    
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
                
                Text(viewModel.subtitle)
                    .font(.system(size: FontSize.small.value, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.bottom, Spacing.nano.value)
                
                LIOTextField(placeholder: viewModel.placeholder, textField: $textField, textFieldType: .name)
                    .padding(.horizontal, Spacing.defaultMargin.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                CardComponent(title: viewModel.buttonLabel, color: .appYellow, variant: .small)
                    .onTapGesture {
                        viewModel.joinGame(roomCode: textField, completionHandler: { (response) in
                            if response == .success {
                                //TODO: - go to waiting room
                            } else if response == .failed {
                                //TODO: - show alert
                            } else {
                                //TODO: - show activity indicator
                            }
                        })
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

//struct JoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        JoinView()
//    }
//}
