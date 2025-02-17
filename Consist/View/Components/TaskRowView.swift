//
//  TaskRowView.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 12.02.2025.
//

import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task
    var body: some View {
        HStack(alignment: .center,spacing: 8) {
            Image(systemName: task.icon)
                .font(.system(size: 20))
                .foregroundStyle(task.tint)
                .padding(6)
                .background(Color.iconBG,in: Circle())
            
            HStack {
                VStack(alignment: .leading,spacing: 8) {
                    Text(task.title)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                    Label(task.creationDate.format("HH:mm"), systemImage: "clock")
                        .font(.caption)
                }
                .padding(8)
                .hSpacing(.leading)
                .strikethrough(task.completed, color: .black)
                .foregroundStyle(.black)
                
                
                Checkbox(isChecked: $task.completed, tintColor: $task.tint)       
            }
        }
        .hSpacing(.leading)
    }
}

#Preview {
    TaskRowView(task: .constant(sampleTasks[1]))
}
