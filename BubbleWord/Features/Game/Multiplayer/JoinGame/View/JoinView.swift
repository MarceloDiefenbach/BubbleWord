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
    @EnvironmentObject var coordinator: HomeCoordinator
    
    @State private var roomCodeField: String = ""
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
                
                LIOTextField(placeholder: viewModel.placeholder, textField: $roomCodeField, textFieldType: .roomCode)
                    .padding(.horizontal, Spacing.defaultMargin.value)
                    .padding(.bottom, Spacing.xxxs.value)
                
                CardComponent(title: viewModel.buttonLabel, color: .appYellow, variant: .small)
                    .onTapGesture {
                        UserDefaults.standard.set(roomCodeField, forKey: "roomCode")
                        viewModel.joinGame(roomCode: roomCodeField) { response in
                            switch response {
                            case .success:
                                self.coordinator.isPresentingView = .waitingRoom
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
                
                BannerAd(unitID: AdMobService.instance.joinGameView).frame(height: 50)
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
