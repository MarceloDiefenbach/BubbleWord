//
//  ConfettiParticles.swift
//  BubbleWord
//
//  Created by Annderson Packeiser Oreto on 18/11/22.
//

import Foundation
import SwiftUI

struct FireworkParticlesGeometryEffect : GeometryEffect {
    
    var time: Double
    var speed: Double = Double.random(in: 80...400)
    var direction: Double = Double.random(in: -Double.pi...Double.pi)
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}

struct ParticlesModifier: ViewModifier {
    
    @State var time: Double = 0.0
    @State var scale: Double = 0.1
    let duration: Double = 1.0
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<30, id: \.self) { index in
                content
                    .hueRotation(Angle(degrees: time * 80))
                    .scaleEffect(scale)
                    .modifier(FireworkParticlesGeometryEffect(time: time))
                    .opacity(((duration-time) / duration))
            }
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 2.0
            }
        }
    }
}
