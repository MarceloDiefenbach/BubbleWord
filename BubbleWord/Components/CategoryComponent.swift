//
//  CategoryComponent.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

struct CategoryComponent: View {
    
    // MARK: - Variables
    
    var title: String
    var color: Color
    
    // MARK: - Init
    
    init(title: String, color: Color) {
        self.title = title
        self.color = color
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.vertical, 40)
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)
        .background(color)
        .cornerRadius(16)
    }
}

struct CategoryComponent_Previews: PreviewProvider {
    static var previews: some View {
        CategoryComponent(title: "Casual", color: .appYellow)
    }
}

