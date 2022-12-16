//
//  BubbleWordApp.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 01/11/22.
//

import SwiftUI
import UXCamSwiftUI
import UXCam

@main
struct ContentView: App {
    
    @ObservedObject private var homeCoordinator: HomeCoordinator = HomeCoordinator()
    
    init(){
        UXCam.optIntoSchematicRecordings()
        let config = UXCamSwiftUI.Configuration(appKey: "4rihizv13f61l6y")
        UXCamSwiftUI.start(with: config)
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if homeCoordinator.isPresentingView == .home {
                HomeView()
                    .environmentObject(homeCoordinator)
            } else if homeCoordinator.isPresentingView == .waitingRoom {
                WaitingRoomView()
                    .environmentObject(homeCoordinator)
            } else if homeCoordinator.isPresentingView == .play {
                GameView()
                    .environmentObject(homeCoordinator)
            }
        }
    }
}
