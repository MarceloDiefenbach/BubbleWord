//
//  YouLoseView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 11/11/22.
//

import SwiftUI

struct YouLoseView: View {
    
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
            ZStack {
                VStack{
                    Color("red")
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.7)
                VStack {
                    HStack {
                        Text("Você\nperdeu")
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 20)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Text("Continuar jogo")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                    .background(Color.white)
                    .cornerRadius(50)
                }.onTapGesture {
                    action()
                }
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.8)
        }
    }
}

struct YouLoseView_Previews: PreviewProvider {
    static var previews: some View {
        YouLoseView(action: {})
    }
}