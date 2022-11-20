//
//  YouLoseView.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 11/11/22.
//

import SwiftUI

struct YouLoseView: View {
    
    // MARK: - Variables
    
    var action: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
            
            ZStack {
                VStack {
                    Color("red")
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.7)
                
                VStack {
                    HStack {
                        Text("You\nlose")
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, Spacing.xxxs.value)
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Text("Continue playing")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, Spacing.xxxs.value)
                            .padding(.vertical, Spacing.nano.value)
                    }
                    .background(Color.white)
                    .cornerRadius(CornerRadius.circular.value)
                }.onTapGesture {
                    action()
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.8)
        }
    }
}

struct YouLoseView_Previews: PreviewProvider {
    static var previews: some View {
        YouLoseView(action: {})
    }
}
