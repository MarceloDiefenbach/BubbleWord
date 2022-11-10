//
//  ContentView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 01/11/22.
//

import SwiftUI

struct GameView: View {
    
    @State var letters: [Letter] = [
        Letter(letter: "A", state: .inactive, colorIndex: 1),
        Letter(letter: "B", state: .active, colorIndex: 2),
        Letter(letter: "C", state: .active, colorIndex: 3),
        Letter(letter: "D", state: .inactive, colorIndex: 1),
        Letter(letter: "E", state: .active, colorIndex: 2),
        Letter(letter: "F", state: .active, colorIndex: 3),
        Letter(letter: "G", state: .active, colorIndex: 1),
        Letter(letter: "H", state: .inactive, colorIndex: 2),
        Letter(letter: "I", state: .inactive, colorIndex: 1),
        Letter(letter: "J", state: .active, colorIndex: 2),
        Letter(letter: "K", state: .active, colorIndex: 3),
        Letter(letter: "L", state: .active, colorIndex: 1)
    ]

    @State var flipped: Bool = false
    
    var body: some View {
        
        let flipDegrees = flipped ? 180.0 : 0

        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Puxe uma nova carta")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
                
                ZStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).foregroundColor(.blue)
                        Text("Diga o nome de uma marca")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.all, UIScreen.main.bounds.width*0.18)
                    }.flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).foregroundColor(.green)
                        Text("Ofenda alguem")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.all, UIScreen.main.bounds.width*0.18)
                    }.flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
                }
                .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.width*0.7)
                .padding(.bottom, 24)
                .animation(.easeInOut(duration: 0.3))
                .onTapGesture {
                    self.flipped.toggle()
                    
                    //TODO: logic to change card content
                    // if flippet == true change card 1 else change card 2
                }
                
                Text("Marque a letra inicial da\npalavra que você falou")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 24)
                
                HStack {
                    ForEach(0..<4) { i in
                        LetterComponent(letter: letters[i])
                            .onTapGesture(perform: {
                                if letters[i].state == .active {
                                    //TODO: - change state of letter to inactive
                                }
                            })
                    }
                }
                
                HStack {
                    ForEach(4..<8) { i in
                        LetterComponent(letter: letters[i])
                            .onTapGesture(perform: {
                                if letters[i].state == .active {
                                    //TODO: - change state of letter to inactive
                                }
                            })
                    }
                }
                
                HStack {
                    ForEach(8..<12) { i in
                        LetterComponent(letter: letters[i])
                            .onTapGesture(perform: {
                                if letters[i].state == .active {
                                    //TODO: - change state of letter to inactive
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
