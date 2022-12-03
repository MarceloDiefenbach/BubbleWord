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
    @State private var isSettingsShowing: Bool = false
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
                    
                    CardComponent(title: NSLocalizedString("singleDeviceTitle", comment: ""), subtitle: NSLocalizedString("singleDeviceDescription", comment: ""), color: .appRed)
                        .onTapGesture {
                            self.isSingleDeviceViewShowing = true
                        }
                    
                    CardComponent(title: NSLocalizedString("multiplayerTitle", comment: ""), subtitle: NSLocalizedString("multiplayerDescription", comment: ""), color: .appBlue)
                        .onTapGesture {
                            self.isMultiplayerViewShowing = true
                        }
                    
                    if #available(iOS 15.0, *) {
                        ButtonComponent(label: NSLocalizedString("howToPlayButton", comment: ""), image: "questionmark.circle", action: {
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
                        ButtonComponent(label: NSLocalizedString("howToPlayButton", comment: ""), image: "questionmark.circle", action: {
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
                    
                    CardComponent(title: NSLocalizedString("storeButton", comment: ""), image: "bag.circle", color: .appYellow)
                        .onTapGesture {
                            self.isStoreiewShowing = true
                        }
                    
                    if #available(iOS 15.0, *) {
                        ButtonComponent(label: "Settings", image: "gearshape", action: {
                            isSettingsShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .padding(.bottom, Spacing.xxs.value + 50)
                        .adaptiveSheet(isPresented: $isSettingsShowing, detents: [.medium()], smallestUndimmedDetentIdentifier: .medium){
                            Settings()
                        }
                    } else {
                        ButtonComponent(label: "Settings", image: "gearshape", action: {
                            isSettingsShowing.toggle()
                        })
                        .padding(.top, Spacing.xxxs.value)
                        .padding(.bottom, Spacing.xxs.value + 50)
                        .sheet(isPresented: $isSettingsShowing, content: {
                            Settings()
                        })
                    }
                }
                
                VStack {
                    Spacer()
                    
                    BannerAd(unitID: "ca-app-pub-7490663355066325/6944771661").frame(height: 50)
                        .padding(.bottom, Spacing.xxxs.value)
                }.ignoresSafeArea()
                
                //MARK: - navigations
                
                NavigationLink("", isActive: $isSingleDeviceViewShowing) {
                    DifficultyView()
                }.hidden()
                
                NavigationLink("", isActive: $isMultiplayerViewShowing) {
                    MultiplayerView()
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
