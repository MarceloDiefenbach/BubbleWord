//
//  CategoryComponent.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 13/11/22.
//

import SwiftUI

enum CardComponentType {
    case small, large
}

struct CardComponent: View {
    
    // MARK: - Variables
    
    var title: String
    var subtitle: String
    var image: String
    var color: Color
    var variant: CardComponentType
    var verticalPadding: CGFloat?
    
    // MARK: - Init
    
    init(title: String, subtitle: String = "", image: String = "", color: Color, variant: CardComponentType = .large) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.color = color
        self.variant = variant
    }
    
    // MARK: - Body
    
    var body: some View {
        
        HStack {
            VStack {
                HStack {
                    if !image.isEmpty {
                        Image(systemName: image)
                            .font(.system(size: FontSize.large.value, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Text(title)
                        .font(.system(size: FontSize.large.value, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                
                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.system(size: FontSize.xs.value, weight: .regular))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.vertical, variant == CardComponentType.large ? Spacing.small.value : Spacing.xxxs.value)
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)
        .background(color)
        .cornerRadius(CornerRadius.small.value)
    }
}

struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardComponent(title: "Casual", color: .appYellow)
    }
}
