//
//  Letter.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 01/11/22.
//

import SwiftUI

struct LetterComponent: View {
    
    // MARK: - Variables
    
    var letter: Letter
    
    // MARK: - Body
    
    var body: some View {
        ZStack {            
            if letter.state == true {
                if 1 == letter.colorIndex {
                    Image("Blue")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else if 2 == letter.colorIndex {
                    Image("Red")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else if 3 == letter.colorIndex {
                    Image("Yellow")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                Text(letter.letter)
                    .foregroundColor(.white)
                    .font(.system(size: FontSize.large.value, weight: .bold, design: .default))
            } else {
                Image("Inactive")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                Text(letter.letter)
                    .foregroundColor(.white)
                    .font(.system(size: FontSize.large.value, weight: .bold, design: .default))
                    .opacity(0.5)
            }
        }.cornerRadius(CornerRadius.circular.value)
            .frame(width: 70, height: 70)
    }
}

struct Letter_Previews: PreviewProvider {
    static var previews: some View {
        LetterComponent(letter: Letter(letter: "a", state: true, colorIndex: 1))
    }
}
