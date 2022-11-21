//
//  InviteParticipants.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 21/11/22.
//

import SwiftUI

struct CreateGameSession: View {
    
    @State var inviteCode: String
    @State var inviteCodeArray: Array = ["a", "a", "a", "a", "a"]
    @State var participants: [Participant] = [Participant(id: UUID(), name: "Marcelo"), Participant(id: UUID(), name: "Chumiga")]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Play game")
                        .foregroundColor(.white)
                        .font(.system(size: FontSize.large.value, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, Spacing.quarck.value)
                    
                    Text("Share this code with your friends")
                        .foregroundColor(.white)
                        .font(.system(size: FontSize.small.value, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, Spacing.small.value)
                    
                    HStack {
                        ForEach(inviteCodeArray, id: \.self) {
                            InviteLetterComponent(letter: $0, variant: .onlyView)
                        }
                    }.frame(height: 80)
                        .padding(.bottom, Spacing.xxs.value)
                    
                    Text("Participants already in")
                        .foregroundColor(.white)
                        .font(.system(size: FontSize.xs.value, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, Spacing.xxxs.value)
                    
                    ScrollView {
                        ForEach(0..<Int(participants.count), content: { index in
                            HStack {
                                Text(participants[index].name)
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
                    
                    CardComponent(title: "Start game", color: .appYellow, variant: .small)
                        .padding(.bottom, Spacing.xxxs.value)
                }
                .padding(.horizontal, Spacing.defaultMargin.value)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            inviteCodeArray = inviteCode.map { String($0) }
            print(inviteCodeArray[0])
        }
    }
    
    func copyInviteCode() {
        UIPasteboard.general.string = self.inviteCode
    }
    
}

struct InviteParticipants_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameSession(inviteCode: "ABCDE")
    }
}
