//
//  InviteParticipants.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 21/11/22.
//

import SwiftUI

struct CreateGameView: View {
    
    @ObservedObject private var viewModel: CreateGameViewModel = CreateGameViewModel()
    @EnvironmentObject var coordinator: GameCoordinator
    @EnvironmentObject var homeCoordinator: HomeCoordinator
    
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
                    .padding(.top, Spacing.xxxs.value)
                    .padding(.bottom, Spacing.quarck.value)
                
                Text(viewModel.instruction)
                    .foregroundColor(.white)
                    .font(.system(size: FontSize.small.value, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, Spacing.small.value)
                
                HStack {
                    ForEach(viewModel.inviteCodeArray, id: \.self) {
                        InviteLetterComponent(letter: $0, variant: .onlyView)
                    }
                }.frame(height: 80)
                    .padding(.bottom, Spacing.xxs.value)
                
                Text(viewModel.participantsTitle)
                    .foregroundColor(.white)
                    .font(.system(size: FontSize.xs.value, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, Spacing.xxxs.value)
                
                ScrollView {
                    ForEach(0..<Int(viewModel.participants.count), content: { index in
                        HStack {
                            Text(viewModel.participants[index].name)
                                .font(.system(size: FontSize.medium.value, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.vertical, Spacing.xxxs.value)
                        }
                        .frame(width: UIScreen.main.bounds.width*0.9)
                        .background(Color.appGray)
                        .cornerRadius(CornerRadius.small.value)
                    })
                }
                
                CardComponent(title: viewModel.startButtonLabel, color: .appYellow, variant: .small)
                    .padding(.bottom, Spacing.xxxs.value)
                    .onTapGesture {
                        coordinator.isPresentingView = .playGame
                    }
                
                ButtonComponent(label: "End game", image: "rectangle.portrait.and.arrow.right", action: {
                    homeCoordinator.isPresentingView = .home
                })
                .padding(.top, Spacing.quarck.value)
                .padding(.bottom, Spacing.xs.value)
            }
            .padding(.horizontal, Spacing.defaultMargin.value)
        }
        .onAppear() {
            viewModel.inviteCodeArray = viewModel.inviteCode.map { String($0) }
        }
    }
    
    func copyInviteCode() {
        UIPasteboard.general.string = self.viewModel.inviteCode
    }
    
}

struct InviteParticipants_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView()
    }
}
