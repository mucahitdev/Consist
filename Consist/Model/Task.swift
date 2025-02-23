//
//  Task.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 11.02.2025.
//

import SwiftUI
import SwiftData

@Model
class Task:Identifiable {
    var id: UUID = UUID()
    var title: String
    var creationDate: Date = Date()
    var completed = false
    var tint: String
    var icon: String
    
    init(id: UUID = UUID(), title: String, creationDate: Date = .init(), completed: Bool = false, tint: String, icon: String) {
        self.id = id
        self.title = title
        self.creationDate = creationDate
        self.completed = completed
        self.tint = tint
        self.icon = icon
    }
    
    var tintColor: Color {
        switch tint {
        case "TaskColor1": return .taskColor1
        case "TaskColor2": return .taskColor2
        case "TaskColor3": return .taskColor3
        case "TaskColor4": return .taskColor4
        case "TaskColor5": return .taskColor5
        default: return .black
        }
            
    }
}
