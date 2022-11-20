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
    @State private var isStoreiewShowing: Bool = false
    @State private var isAboutShowing: Bool = false
    @State private var isHowToPlayShowing: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
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
                    
                    CardComponent(title: "Create Game", subtitle: "One or multiple devices", color: .appRed)
                        .onTapGesture {
                            self.isCreateGameViewShowing = true
                        }
                    
                    CardComponent(title: "Join Game", subtitle: "Join a session", color: .appBlue)
                        .onTapGesture {
                            self.isJoinGameViewShowing = true
                        }
                    
                    if #available(iOS 15.0, *) {
                        ButtonComponent(label: "How to play?", image: "questionmark.circle", action: {
                            isHowToPlayShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .padding(.bottom, Spacing.xs.value)
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
                                            isHowToPlayShowing.toggle()
                                        }
                                )
                                .ignoresSafeArea()
                        }
                    } else {
                        ButtonComponent(label: "How to play?", image: "questionmark.circle", action: {
                            isHowToPlayShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .padding(.bottom, Spacing.xs.value)
                        .fullScreenCover(isPresented: $isHowToPlayShowing, content: {
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
                                            isHowToPlayShowing.toggle()
                                        }
                                )
                                .ignoresSafeArea()
                        })
                    }
                    
                    Spacer()
                    
                    CardComponent(title: "Store", image: "bag.circle", color: .appYellow)
                        .onTapGesture {
                            self.isStoreiewShowing = true
                        }
                    
                    if #available(iOS 15.0, *) {
                        ButtonComponent(label: "About us", image: "person.text.rectangle", action: {
                            isAboutShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .padding(.bottom, Spacing.medium.value)
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
                    } else {
                        ButtonComponent(label: "About us", image: "person.text.rectangle", action: {
                            isAboutShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .padding(.bottom, Spacing.medium.value)
                        .fullScreenCover(isPresented: $isAboutShowing, content: {
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
                        })
                    }
                }
                
                //MARK: - navigations
                
                NavigationLink("", isActive: $isCreateGameViewShowing) {
                    DifficultyView()
                }.hidden()
                
                NavigationLink("", isActive: $isJoinGameViewShowing) {
                    EmptyView()
                }.hidden()
                
                NavigationLink("", isActive: $isStoreiewShowing) {
                    EmptyView()
                }.hidden()
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
