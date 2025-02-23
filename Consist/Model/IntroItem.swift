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
    var description: String
    
    var scale: CGFloat = 1
    var anchor: UnitPoint = .center
    var offset: CGFloat = 0
    var rotation: CGFloat = 0
    var zindex: CGFloat = 0
}

let inroPageItems: [IntroItem] = [
    .init(
        image:"calendar.circle.fill",
        title:"Track your daily\nhabits",
        description: "Consist helps you to track your\ndaily habits and achieve your goals.",
        scale: 1
    ),
    .init(
        image:"checkmark.circle.fill",
        title:"Stay consistent with your\nworkouts",
        description: "Form habits and stay consistent\nwith your daily workouts.",
        scale: 0.6,
        anchor: .topLeading,
        offset: -70,
        rotation: 30
    ),
    .init(
        image:"star.circle.fill",
        title:"Stay motivated with your\nprogress",
        description: "Keep track of your progress and\nstay motivated.",
        scale: 0.5,
        anchor: .bottomLeading,
        offset: -60,
        rotation: -35
    ),
    .init(
        image:"flame.circle.fill",
        title:"Stay consistent with your\nworkouts",
        description: "Tarck streaks and stay consistent\nwith your workouts.",
        scale: 0.4,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 160
    ),
    .init(
        image:"clock.circle.fill",
        title:"Track your daily\nhabits",
        description: "Consist helps you to track your\ndaily habits and achieve your goals.",
        scale: 0.35,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 250
    ),
]
