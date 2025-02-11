//
//  Task.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 11.02.2025.
//

import SwiftUI

struct Task {
    var id:UUID = .init()
    var title: String
    var creationDate: Date = .init()
    var completed = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(title: "Create a new project",creationDate: .updateHour(-2), tint: .taskColor1),
    .init(title: "Drink a coffee",creationDate: .updateHour(-1), tint: .taskColor2),
    .init(title: "Write a blog post",creationDate: .updateHour(0), tint: .taskColor3),
    .init(title: "Go for a walk",creationDate: .updateHour(1), tint: .taskColor4),
    .init(title: "Prepare a presentation",creationDate: .updateHour(2), tint: .taskColor5),
]

extension Date {
    static func updateHour(_ value:Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour,value: value, to: .init()) ?? .init()
    }
        
}
