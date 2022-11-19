//
//  HomeView.swift
//  BubbleWord
//
//  Created by Annderson Packeiser Oreto on 18/11/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    // MARK: - Variables
    
    @State private var isCreateGameViewShowing: Bool = false
    @State private var isJoinGameViewShowing: Bool = false
    @State private var isAboutShowing: Bool = false
    @State private var isHowToPlayShowing: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Letters.io")
                    .font(.system(size: FontSize.large.value, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, Spacing.small.value)
                
                ButtonComponent(title: "Create Game", subtitle: "One or multiple devices", color: .appRed)
                    .onTapGesture {
                        self.isCreateGameViewShowing = true
                    }
                    .fullScreenCover(isPresented: $isCreateGameViewShowing, content: {
                        DifficultyView()
                    })
                
                ButtonComponent(title: "Join Game", subtitle: "Join a session", color: .appBlue)
                    .onTapGesture {
                        self.isJoinGameViewShowing = true
                    }
                    .fullScreenCover(isPresented: $isJoinGameViewShowing, content: {
                        EmptyView()
                    })
                
                if #available(iOS 15.0, *) {
                    Button {
                        isHowToPlayShowing.toggle()
                    } label: {
                        HStack {
                            Image("questionmark.circle")
                            Text("How to play?")
                                .font(.system(size: FontSize.xs.value, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, Spacing.xxs.value)
                    .adaptiveSheet(isPresented: $isHowToPlayShowing, detents: [.medium()], smallestUndimmedDetentIdentifier: .medium){
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .foregroundColor([.appRed, .appBlue, .appYellow].randomElement())
                            .overlay(
                                Text("Here's how to play:\n\nWhen a theme appears in the card, you will have 10 seconds to say of a word matching the theme and beginning with any of the letters in the poll of letters and tap it.")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .onTapGesture {
                                        isAboutShowing.toggle()
                                    }
                            )
                            .ignoresSafeArea()
                    }
                }
                
                Spacer()
                
                ButtonComponent(title: "Store", image: "bag.circle", color: .appYellow)
                    .onTapGesture {
                        self.isJoinGameViewShowing = true
                    }
                    .fullScreenCover(isPresented: $isJoinGameViewShowing, content: {
                        EmptyView()
                    })
                
                if #available(iOS 15.0, *) {
                    Button {
                        isAboutShowing.toggle()
                    } label: {
                        HStack {
                            Image("questionmark.circle")
                            Text("About Us")
                                .font(.system(size: FontSize.xs.value, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, Spacing.xxs.value)
                    .adaptiveSheet(isPresented: $isAboutShowing, detents: [.medium()], smallestUndimmedDetentIdentifier: .medium){
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .foregroundColor([.appRed, .appBlue, .appYellow].randomElement())
                            .overlay(
                                Text("App creators:\n\nAnnderson Oreto\n Marcelo Diefenbach\n\nContact-us via e-mail:\nanndersonp@gmail.com")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .onTapGesture {
                                        isAboutShowing.toggle()
                                    }
                            )
                            .ignoresSafeArea()
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
