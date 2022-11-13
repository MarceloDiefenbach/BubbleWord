//
//  HomeView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                CategoryComponent(BWColor: .yellow)
                CategoryComponent(BWColor: .red)
                CategoryComponent(BWColor: .blue)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
