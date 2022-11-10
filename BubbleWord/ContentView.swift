//
//  ContentView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 01/11/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Letter(letter: "A", state: .normal)
                Letter(letter: "A", state: .disabled)
                Letter(letter: "A", state: .normal)
                Letter(letter: "A", state: .disabled)
                Letter(letter: "A", state: .normal)
            }
            HStack {
                Letter(letter: "A", state: .normal)
                Letter(letter: "A", state: .disabled)
                Letter(letter: "A", state: .normal)
                Letter(letter: "A", state: .disabled)
                Letter(letter: "A", state: .normal)
            }
            HStack {
                Letter(letter: "A", state: .normal)
                Letter(letter: "A", state: .disabled)
                Letter(letter: "A", state: .normal)
                Letter(letter: "A", state: .disabled)
                Letter(letter: "A", state: .normal)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
