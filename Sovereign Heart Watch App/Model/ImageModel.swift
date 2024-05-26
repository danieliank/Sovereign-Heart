//
//  ImageModel.swift
//  Sovereign Heart Watch App
//
//  Created by Daniel Ian on 23/05/24.
//

import Foundation

class ImageModel: ObservableObject {
    @Published var charIndex = 0
    let char = ["Char1", "Char2", "Char3", "Char4", "Char5", "Char6", "Char7", "Char8", "Char9", "Char10", "Char11", "Char12", "Char13", "Char14", "Char15", "Char16", "Char17", "Char18"]
    
    @Published var zombieIndex = 0
    let zombie = ["Zombie1", "Zombie2", "Zombie3", "Zombie4", "Zombie5", "Zombie6", "Zombie7", "Zombie8"]
    @Published var zombieOffset: CGFloat = 100
}
