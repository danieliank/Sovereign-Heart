//
//  StartView.swift
//  Sovereign Heart Watch App
//
//  Created by Daniel Ian on 24/05/24.
//

import SwiftUI

struct StartView: View {
    @State private var isAnimating = false

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .blur(radius: 2)
                    .offset(y: -300)
                NavigationLink(destination: HeartRateView().navigationBarBackButtonHidden(true)) {
                    Image("StartButton")
                        .resizable()
                        .frame(width: 128, height: 128)
                        .scaleEffect(isAnimating ? 1.2 : 1.0)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                        .onAppear {
                            self.isAnimating = true
                        }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    StartView()
}

