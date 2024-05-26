//
//  GameOverView.swift
//  Sovereign Heart Watch App
//
//  Created by Daniel Ian on 24/05/24.
//

import SwiftUI

struct GameOverView: View {
    @State private var isAnimating = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 2)
                
                NavigationLink(destination: HeartRateView().navigationBarBackButtonHidden(true)) {
                    Image("RestartButton")
                        .resizable()
                        .frame(width: 128, height: 128)
                }
                .buttonStyle(PlainButtonStyle())
                .onTapGesture {
                    menuSound()
                }
            }
        }
        .onAppear {
            menuSound()
        }
    }
}

#Preview {
    GameOverView()
}
