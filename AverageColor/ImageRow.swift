//
//  ImageRow.swift
//  AverageColor
//
//  Created by Maksym Yevtukhivskyi on 10.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageRow: View {
    @State private var bottomGradientColor: Color = .clear
    private let urlString: String
    private let gradientHeight: CGFloat = 100
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            image
                .gradientOverlay(color: bottomGradientColor, height: gradientHeight)
            text
        }
    }
    
    @ViewBuilder
    private var image: some View {
        if let url = URL(string: urlString) {
            WebImage(url: url)
                .onSuccess { image, _, _ in
                    if let averageColor = AverageColorUtility.getAverageColor(for: image, side: .bottom) {
                        let resultColor = averageColor.darker()
                        self.bottomGradientColor = Color(resultColor)
                    }
                }
                .resizable()
                .transition(.fade(duration: 0.25))
                .scaledToFit()
        }
    }
    
    private var text: some View {
        Text(urlString)
            .font(.body)
            .foregroundColor(.white)
            .lineLimit(1)
            .padding()
    }
}
