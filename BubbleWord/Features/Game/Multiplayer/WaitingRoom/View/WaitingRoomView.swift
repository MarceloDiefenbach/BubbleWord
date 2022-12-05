//
//  WaitingRoomView.swift
//  BubbleWord
//
//  Created by Annderson Packeiser Oreto on 01/12/22.
//

import SwiftUI

struct WaitingRoomView: View {
    
    @ObservedObject private var viewModel: WaitingRoomViewModel = WaitingRoomViewModel()
    
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
                    
                    Text(viewModel.participantsTitle)
                        .foregroundColor(.white)
                        .font(.system(size: FontSize.xs.value, weight: .regular))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, Spacing.xxxs.value)
                    
                    ScrollView {
                        ForEach(viewModel.participants, id: \.id) { participant in
                            HStack {
                                Text(participant.name)
                                    .foregroundColor(.white)
                                    .padding(.vertical, Spacing.xxxs.value)
                            }
                            .frame(width: UIScreen.main.bounds.width*0.9)
                            .background(Color.appGray)
                            .cornerRadius(CornerRadius.small.value)
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height*0.3)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .padding(.horizontal, Spacing.defaultMargin.value)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WaitingRoomView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoomView()
    }
}
