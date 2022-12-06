//
//  WaitingRoomView.swift
//  BubbleWord
//
//  Created by Annderson Packeiser Oreto on 01/12/22.
//

import SwiftUI

struct WaitingRoomView: View {
    
    @ObservedObject private var viewModel: WaitingRoomViewModel = WaitingRoomViewModel()
    @EnvironmentObject var coordinator: HomeCoordinator
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text(viewModel.title)
                    .foregroundColor(.white)
                    .font(.system(size: FontSize.large.value, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, Spacing.quarck.value)
                
                Text(viewModel.instruction)
                    .foregroundColor(.white)
                    .font(.system(size: FontSize.small.value, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, Spacing.small.value)
                
                Text(viewModel.participantsTitle)
                    .foregroundColor(.white)
                    .font(.system(size: FontSize.xs.value, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, Spacing.xxxs.value)
                
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.participants, id: \.id) { participant in
                        HStack {
                            Text(participant.name)
                                .font(.system(size: FontSize.medium.value, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.vertical, Spacing.xxxs.value)
                        }
                        .frame(width: UIScreen.main.bounds.width*0.9)
                        .background(Color.appGray)
                        .cornerRadius(CornerRadius.small.value)
                    }
                }
                .frame(height: UIScreen.main.bounds.height*0.5)
                .frame(maxWidth: .infinity)
                .padding(.bottom, Spacing.xxs.value)
                
                ButtonComponent(label: "Leave the game", image: "rectangle.portrait.and.arrow.right", action: {
                    //TODO: - show an alert to confirm if user want to leave the game
                    viewModel.leaveRoom()
                    coordinator.isPresentingView = .home
                })
            }
            .padding(.horizontal, Spacing.defaultMargin.value)
        }
    }
}

struct WaitingRoomView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoomView()
    }
}
