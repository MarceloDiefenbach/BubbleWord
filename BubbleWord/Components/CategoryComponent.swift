//
//  CategoryComponent.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

struct CategoryComponent: View {
    
    @State var title: String
    @State var BWColor: BWColors
    
    var body: some View {
        HStack {
            Text("Casual")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.vertical, 40)
        }
        .frame(width: UIScreen.main.bounds.width*0.9)
        .background(BWColor.color)
        .cornerRadius(16)
    }
}

struct CategoryComponent_Previews: PreviewProvider {
    static var previews: some View {
        CategoryComponent(title: "Casual", BWColor: BWColors.yellow)
    }
}

