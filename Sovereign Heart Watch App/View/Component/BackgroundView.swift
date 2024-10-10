//
//  Background.swift
//  Sovereign Heart
//
//  Created by Daniel Ian on 10/10/24.
//
import SwiftUI

struct BackgroundView: View {
    var scale: CGFloat = 5
    var offsetY: CGFloat = 0
    
    var body: some View {
        Image("Background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .scaleEffect(scale)
            .offset(y: offsetY)
            .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    BackgroundView(offsetY: 0)
}
