//
//  TestHeartRatae.swift
//  Sovereign Heart Watch App
//
//  Created by Daniel Ian on 20/05/24.
//
import SwiftUI

struct HeartRateView: View {
    @ObservedObject private var imageModel = ImageModel()
    @ObservedObject private var heartRateManager = HeartRateManager()
    
    @State private var gameOver = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView(offsetY: -500)
                ZStack {
                    PngSequenceView(imageNames: imageModel.zombie, frameDuration: 0.2, width: 75, height: 75)
                        .offset(x: imageModel.zombieOffset, y: 0)
                        .onAppear {
                            moveZombie(zombieOffset: $imageModel.zombieOffset)
                        }
                    VStack {
                        HStack {
                            Image("Sword")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .offset(x: 4)
                            Text("\(String(format: "%.0f", heartRateManager.heartRate))")
                                .font(.custom("PixelifySans-Regular", size: 20))
                                .foregroundColor(heartRateManager.heartRate > 100 ? .green5 : .red5)
                        }
                        .offset(x: -12, y: 8)
                        PngSequenceView(imageNames: imageModel.char, frameDuration: 0.2, width: 75, height: 75)
                            .colorMultiply(colorSelection(charColorLayer: heartRateManager.charColorLayer))
                    }
                    .offset(x: -20, y: -12)
                }
                VStack {
                    ForEach(0..<2) { row in
                        HStack {
                            ForEach(0..<5) { col in
                                let index = row * 5 + col
                                if index < heartRateManager.health {
                                    Image("HeartFilled")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                        .padding(-2)
                                } else {
                                    Image("HeartEmpty")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                        .padding(-2)
                                }
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .offset(x: 92, y: -32)
                NavigationLink(destination: GameOverView().navigationBarBackButtonHidden(true), isActive: $gameOver) {
                    
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarBackButtonHidden(true)
            .onChange(of: heartRateManager.heartRate) { newValue in
                heartRateManager.handleHeartRateChange(heartRate: newValue)
            }
            .onChange(of: heartRateManager.health) { newValue in
                if newValue <= 0 {
                    gameOver = true
                }
            }
        }
    }
}

#Preview {
    HeartRateView()
}
