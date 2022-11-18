//
//  ContentView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 01/11/22.
//

import SwiftUI

struct GameView: View {
    
    // MARK: - Variables
    
    @ObservedObject private var viewModel: GameViewModel
    @Binding var isShowing: Bool
    
    // MARK: - Init
    
    public init(gameDifficulty: Difficulty, isShowing: Binding<Bool>) {
        self.viewModel = GameViewModel(gameDifficulty: gameDifficulty)
        self._isShowing = isShowing
    }
    
    // MARK: - Body
    
    var body: some View {
        
        let flipDegrees = viewModel.flipped ? 180.0 : 0
        
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Rectangle()
                    .foregroundColor(.appBlue)
                    .frame(height: 80)
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                VStack {
                    ZStack {
                        Text("\(viewModel.timeRemaining)")
                            .font(.system(size: 60, weight: .heavy))
                            .foregroundColor(.white)
                        
                        HStack {
                            Spacer()
                            
                            Image(systemName: "pause.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    viewModel.isStopped.toggle()
                                }
                        }.padding(.horizontal, 20)
                    }
                    
                    Text(viewModel.currentPlayer)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 24)
                    
                    Text(viewModel.currentPlayer)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .cornerRadius(50)
                        .offset(y: 20)
                }
                .frame(maxWidth: .infinity)
                .background(Color.appBlue)
                
                Spacer()
                
                ZStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).foregroundColor(Color("blue"))
                        Text(viewModel.cardPhrase)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.all, 8)
                    }.flipRotate(flipDegrees).opacity(viewModel.flipped ? 0.0 : 1.0)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).foregroundColor(Color("yellow"))
                        Text(viewModel.cardPhrase)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.all, 8)
                    }.flipRotate(-180 + flipDegrees).opacity(viewModel.flipped ? 1.0 : 0.0)
                }
                .frame(width: UIScreen.main.bounds.width * 0.65, height: hasNotch() ? UIScreen.main.bounds.width * 0.5 : UIScreen.main.bounds.width * 0.65)
                .padding(.bottom, 24)
                .animation(.easeInOut(duration: 0.3))
                
                //MAKR: - Letters grid
                if !viewModel.letters.isEmpty {
                    HStack {
                        ForEach(0..<4) { i in
                            ZStack {
                                if viewModel.letters[i].state == .inactive {
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 12, height: 12)
                                        .modifier(ParticlesModifier())
                                }
                                
                                LetterComponent(letter: viewModel.letters[i])
                                    .onTapGesture(perform: {
                                        if viewModel.letters[i].state == .active {
                                            viewModel.turnInactiveLetter(index: i)
                                        }
                                    })
                            }
                        }
                    }
                    
                    HStack {
                        ForEach(4..<8) { i in
                            ZStack {
                                if viewModel.letters[i].state == .inactive {
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 12, height: 12)
                                        .modifier(ParticlesModifier())
                                }
                                
                                LetterComponent(letter: viewModel.letters[i])
                                    .onTapGesture(perform: {
                                        if viewModel.letters[i].state == .active {
                                            viewModel.turnInactiveLetter(index: i)
                                        }
                                    })
                            }
                        }
                    }
                    
                    HStack {
                        ForEach(8..<12) { i in
                            ZStack {
                                if viewModel.letters[i].state == .inactive {
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 12, height: 12)
                                        .modifier(ParticlesModifier())
                                }
                                
                                LetterComponent(letter: viewModel.letters[i])
                                    .onTapGesture(perform: {
                                        if viewModel.letters[i].state == .active {
                                            viewModel.turnInactiveLetter(index: i)
                                        }
                                    })
                            }
                        }
                    }
                    .padding(.bottom, 24)
                }
            }
            .onReceive(viewModel.timer) { time in
                viewModel.oneSecondPassed()
            }
            
            //MARK: - loseWinView
            if viewModel.lose {
                YouLoseView(action: {
                    viewModel.nextParticipant()
                }).ignoresSafeArea()
            }
            
            if viewModel.isStopped {
                PausedView(playGame: {
                    viewModel.isStopped.toggle()
                }, finishGame: {
                    isShowing.toggle()
                })
            }
        }
    }
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameDifficulty: .easy, isShowing: .constant(true))
    }
}
