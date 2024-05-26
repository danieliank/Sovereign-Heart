//
//  PngSequenceView.swift
//  Sovereign Heart Watch App
//
//  Created by Daniel Ian on 21/05/24.
//

import SwiftUI

struct PngSequenceView: View {
    let imageNames: [String]
    let frameDuration: Double
    let width: CGFloat
    let height: CGFloat
    
    @State private var currentIndex = 0
    
    var body: some View {
        Image(imageNames[currentIndex])
            .resizable()
            .frame(width: width, height: height)
            .onAppear {
                imageAnimation()
            }
    }
    
    func imageAnimation() {
        Timer.scheduledTimer(withTimeInterval: frameDuration, repeats: true) { _ in
            currentIndex = (currentIndex + 1) % imageNames.count
        }
    }
}

