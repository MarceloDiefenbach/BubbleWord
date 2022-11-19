//
//  ButtonComponent.swift
//  BubbleWord
//
//  Created by Marcelo Diefenbach on 19/11/22.
//

import SwiftUI

struct ButtonComponent: View {
    
    // MARK: - Variables
    
    var label: String
    var image: String
    var action: () -> Void
    
    // MARK: - Init
    
    init(label: String, image: String = "", action: @escaping () -> Void) {
        self.label = label
        self.image = image
        self.action = action
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    if !image.isEmpty {
                        Image(systemName: image)
                            .font(.system(size: FontSize.xs.value, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Text(label)
                        .font(.system(size: FontSize.xs.value, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(label: "Casual", image: "questionmark.circle", action: {})
    }
}
