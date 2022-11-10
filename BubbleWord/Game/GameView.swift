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
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundColor(.white)
                    .onReceive(viewModel.timer) { time in
                        viewModel.oneSecondPassed()
                    }
                
                ZStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).foregroundColor(.blue)
                        Text("Diga o nome de uma marca")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.all, UIScreen.main.bounds.width*0.18)
                    }.flipRotate(flipDegrees).opacity(viewModel.flipped ? 0.0 : 1.0)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).foregroundColor(.green)
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
                .onTapGesture {
                    self.viewModel.flipped.toggle()
                    
                    //TODO: logic to change card content
                    // if flipped == true change card 1 else change card 2
                }
                
                Text(viewModel.instruction)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
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

extension View {

      func flipRotate(_ degrees : Double) -> some View {
            return rotation3DEffect(Angle(degrees: degrees), axis: (x: 1.0, y: 0.0, z: 0.0))
      }

      func placedOnCard(_ color: Color) -> some View {
            return padding(5).frame(width: 250, height: 150, alignment: .center).background(color)
      }
}
