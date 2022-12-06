//
//  JoinView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 22/11/22.
//

import SwiftUI

struct JoinView: View {
    
    // MARK: - Variables
    
    @ObservedObject private var viewModel: JoinViewModel = JoinViewModel()
    @EnvironmentObject var coordinator: GameCoordinator
    
    @State private var textField: String = ""
    @State private var isWaitingRoomShowing: Bool = false
    @State private var isAlertPresenting: Bool = false
    
    // MARK: - Body
    
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
                
                LIOTextField(placeholder: viewModel.placeholder, textField: $textField, textFieldType: .name)
                    .padding(.horizontal, Spacing.defaultMargin.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                CardComponent(title: viewModel.buttonLabel, color: .appYellow, variant: .small)
                    .onTapGesture {
                        UserDefaults.standard.set(textField, forKey: "roomCode")
                        viewModel.joinGame(roomCode: textField) { response in
                            switch response {
                            case .success:
                                self.isWaitingRoomShowing = true
                                break
                            case .failed:
                                self.isAlertPresenting = true
                                break
                            case .waiting:
#warning("show activity indicator")
                                break
                            }
                        }
                    }
                    .padding(.bottom, Spacing.xxxs.value + 50)
            }
            
            VStack {
                Spacer()
                
                BannerAd(unitID: "ca-app-pub-7490663355066325/6944771661").frame(height: 50)
                    .padding(.bottom, Spacing.xxxs.value)
            }.ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $isWaitingRoomShowing) {
            WaitingRoomView()
        }
        .alert(isPresented: $isAlertPresenting) {
            Alert(title: Text("Can't join room"), message: Text("Room code is invalid."))
        }
    }
    
}

struct JoinView_Previews: PreviewProvider {
    static var previews: some View {
        JoinView()
    }
}
