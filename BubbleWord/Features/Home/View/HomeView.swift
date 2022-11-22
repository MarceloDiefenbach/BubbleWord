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
    
    @State private var isSingleDeviceViewShowing: Bool = false
    @State private var isMultiplayerViewShowing: Bool = false
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
                    
                    Text("Letters.io")
                        .font(.system(size: FontSize.large.value, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, Spacing.small.value)
                    
                    CardComponent(title: "Single device", subtitle: "Play locally", color: .appRed)
                        .onTapGesture {
                            self.isSingleDeviceViewShowing = true
                        }
                    
                    CardComponent(title: "Multiplayer", subtitle: "Multiple online devices", color: .appBlue)
                        .onTapGesture {
                            self.isMultiplayerViewShowing = true
                        }
                    
                    if #available(iOS 15.0, *) {
                        ButtonComponent(label: "How to play?", image: "questionmark.circle", action: {
                            isHowToPlayShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .padding(.bottom, Spacing.xs.value)
                        .adaptiveSheet(isPresented: $isHowToPlayShowing, detents: [.medium()], smallestUndimmedDetentIdentifier: .medium){
                            HowToPlay()
                                .onTapGesture {
                                    isHowToPlayShowing.toggle()
                                }
                        }
                    } else {
                        ButtonComponent(label: "How to play?", image: "questionmark.circle", action: {
                            isHowToPlayShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .padding(.bottom, Spacing.xs.value)
                        .fullScreenCover(isPresented: $isHowToPlayShowing, content: {
                            HowToPlay()
                                .onTapGesture {
                                    isHowToPlayShowing.toggle()
                                }
                        })
                    }
                    
                    Spacer()
                    
//                    CardComponent(title: "Store", image: "bag.circle", color: .appYellow)
//                        .onTapGesture {
//                            self.isStoreiewShowing = true
//                        }
                    
                    if #available(iOS 15.0, *) {
                        ButtonComponent(label: "About us", image: "person.text.rectangle", action: {
                            isAboutShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .adaptiveSheet(isPresented: $isAboutShowing, detents: [.medium()], smallestUndimmedDetentIdentifier: .medium){
                            AboutUs()
                                .onTapGesture {
                                    isAboutShowing.toggle()
                                }
                        }
                    } else {
                        ButtonComponent(label: "About us", image: "person.text.rectangle", action: {
                            isAboutShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .fullScreenCover(isPresented: $isAboutShowing, content: {
                            AboutUs()
                                .onTapGesture {
                                    isAboutShowing.toggle()
                                }
                        })
                    }
                    
                    BannerAd(unitID: "ca-app-pub-7490663355066325/6944771661").frame(height: 50)
                        .padding(.bottom, Spacing.xxxs.value)
                }
                
                //MARK: - navigations
                
                NavigationLink("", isActive: $isSingleDeviceViewShowing) {
                    DifficultyView()
                }.hidden()
                
                NavigationLink("", isActive: $isMultiplayerViewShowing) {
                    CreateGameSession(inviteCode: "ABCDE")
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
