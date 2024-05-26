//
//  AnimationManager.swift
//  Sovereign Heart Watch App
//
//  Created by Daniel Ian on 21/05/24.
//

import SwiftUI

func menuSound() {
    WKInterfaceDevice.current().play(.notification)
}

func moveZombie(zombieOffset: Binding<CGFloat>) {
    withAnimation(Animation.linear(duration: 3.6).repeatForever(autoreverses: false)) {
        zombieOffset.wrappedValue = -100
    }
}

func colorSelection(charColorLayer: Int) -> Color {
    switch charColorLayer {
    case 0:
        return Color.white
    case 1:
        return Color("Red1")
    case 2:
        return Color("Red2")
    case 3:
        return Color("Red3")
    case 4:
        return Color("Red4")
    case 5:
        return Color("Red5")
    case 6:
        return Color("Red6")
    case 7:
        return Color("Red7")
    case 8:
        return Color("Red8")
    case 9:
        return Color("Red9")
    default:
        return Color.red
    }
}


