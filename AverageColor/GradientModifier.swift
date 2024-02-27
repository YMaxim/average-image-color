//
//  GradientModifier.swift
//  AverageColor
//
//  Created by Maksym Yevtukhivskyi on 10.02.2024.
//

import SwiftUI

struct GradientModifier: ViewModifier {
    let color: Color
    let height: CGFloat
    let alignment: Alignment = .bottom
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: alignment) {
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: color.opacity(0), location: 0),
                        Gradient.Stop(color: color, location: 1)
                    ],
                    startPoint: UnitPoint(x: 0, y: 0),
                    endPoint: UnitPoint(x: 0, y: 1)
                )
                .frame(height: height)
            }
    }
}

extension View {
    func gradientOverlay(color: Color, height: CGFloat) -> some View {
        self.modifier(GradientModifier(color: color, height: height))
    }
}
