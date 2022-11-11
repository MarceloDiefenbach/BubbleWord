//
//  ContentView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 01/11/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        
        let flipDegrees = viewModel.flipped ? 180.0 : 0

        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("\(viewModel.timeRemaining)")
                    .font(.system(size: 60, weight: .heavy))
                    .foregroundColor(.white)
                    .onReceive(viewModel.timer) { time in
                        viewModel.oneSecondPassed()
                    }
                
                ZStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).foregroundColor(Color("blue"))
                        Text("Diga o nome de uma marca")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.all, UIScreen.main.bounds.width*0.18)
                    }.flipRotate(flipDegrees).opacity(viewModel.flipped ? 0.0 : 1.0)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).foregroundColor(Color("yellow"))
                        Text("Ofenda alguem")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.all, UIScreen.main.bounds.width*0.18)
                    }.flipRotate(-180 + flipDegrees).opacity(viewModel.flipped ? 1.0 : 0.0)
                }
                .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.width*0.7)
                .padding(.bottom, 24)
                .animation(.easeInOut(duration: 0.3))
                
                Text(viewModel.instruction)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
                //MAKR: - Letters grid
                HStack {
                    ForEach(0..<4) { i in
                        LetterComponent(letter: viewModel.letters[i])
                            .onTapGesture(perform: {
                                if viewModel.letters[i].state == .active {
                                    viewModel.turnInactiveLetter(index: i)
                                }
                            })
                    }
                }
                
                HStack {
                    ForEach(4..<8) { i in
                        LetterComponent(letter: viewModel.letters[i])
                            .onTapGesture(perform: {
                                if viewModel.letters[i].state == .active {
                                    viewModel.turnInactiveLetter(index: i)
                                }
                            })
                    }
                }
                
                HStack {
                    ForEach(8..<12) { i in
                        LetterComponent(letter: viewModel.letters[i])
                            .onTapGesture(perform: {
                                if viewModel.letters[i].state == .active {
                                    viewModel.turnInactiveLetter(index: i)
                                }
                            })
                    }
                }
                .padding(.bottom, 24)
            }
            .padding()
        }
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
