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
    
    init(){
        UXCam.optIntoSchematicRecordings()
        let config = UXCamSwiftUI.Configuration(appKey: "4rihizv13f61l6y")
        UXCamSwiftUI.start(with: config)
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
