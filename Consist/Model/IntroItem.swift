//
//  IntroItem.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 23.02.2025.
//

import SwiftUI

struct IntroItem: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
    
    var scale: CGFloat = 1
    var anchor: UnitPoint = .center
    var offset: CGFloat = 0
    var rotation: CGFloat = 0
    var zindex: CGFloat = 0
}

let inroPageItems: [IntroItem] = [
    .init(
        image:"figure.walk.circle.fill",
        title:"Keep an eye on your workout and your health",
        scale: 1
    ),
    .init(
        image:"figure.run.circle.fill",
        title:"Keep2 an eye on your workout",
        scale: 0.6,
        anchor: .topLeading,
        offset: -70,
        rotation: 30
    ),
    .init(
        image:"figure.badminton.circle.fill",
        title:"Keep3 an eye on your workout",
        scale: 0.5,
        anchor: .bottomLeading,
        offset: -60,
        rotation: -35
    ),
    .init(
        image:"figure.climbing.circle.fill",
        title:"Keep4 an eye on your workout",
        scale: 0.4,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 160
    ),
    .init(
        image:"figure.cooldown.circle.fill",
        title:"Keep5 an eye on your workout",
        scale: 0.35,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 250
    ),
]
