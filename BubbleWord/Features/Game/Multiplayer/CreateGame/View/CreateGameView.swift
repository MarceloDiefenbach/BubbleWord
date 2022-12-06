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
    
    var body: some View {
        NavigationView {
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
                                    .foregroundColor(.white)
                                    .padding(.vertical, Spacing.xxxs.value)
                            }
                            .frame(width: UIScreen.main.bounds.width*0.9)
                            .background(Color.appGray)
                            .cornerRadius(CornerRadius.small.value)
                        })
                    }
                    .frame(width: .infinity, height: UIScreen.main.bounds.height*0.3)
                    
                    Spacer()
                    
                    CardComponent(title: viewModel.startButtonLabel, color: .appYellow, variant: .small)
                        .padding(.bottom, Spacing.xxxs.value)
                        .onTapGesture {
                            coordinator.isPresentingView = .playGame
                        }
                    
                    Text("Finalizar jogo")
                        .font(.system(size: 12))
                        .onTapGesture {
                            
                        }
                }
                .padding(.horizontal, Spacing.defaultMargin.value)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
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
