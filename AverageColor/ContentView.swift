//
//  ContentView.swift
//  AverageColor
//
//  Created by Maksym Yevtukhivskyi on 07.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(imageUrls, id: \.self) { url in
                    ImageRow(urlString: url)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
