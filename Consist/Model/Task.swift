//
//  Task.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 11.02.2025.
//

import SwiftUI

struct Task:Identifiable {
    var id:UUID = .init()
    var title: String
    var creationDate: Date = .init()
    var completed = false
    var tint: Color
    var icon: String
}

var sampleTasks: [Task] = [
    .init(title: "Create a neADAwdawdjadw adjjwajd adwa dwajdjwa djajdaw project",creationDate: .updateHour(-2), tint: .taskColor1, icon: "star.fill"),
    .init(title: "Drink a coffee",creationDate: .updateHour(-1), tint: .taskColor2, icon: "star.fill"),
    .init(title: "Write a blog post",creationDate: .updateHour(0),completed:true, tint: .taskColor3, icon: "star.fill"),
    .init(title: "Go for a walk",creationDate: .updateHour(1), tint: .taskColor4, icon: "star.fill"),
    .init(title: "Prepare a presentation",creationDate: .updateHour(2), tint: .taskColor5, icon: "star.fill"),
]

extension Date {
    static func updateHour(_ value:Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour,value: value, to: .init()) ?? .init()
    }
        
}
