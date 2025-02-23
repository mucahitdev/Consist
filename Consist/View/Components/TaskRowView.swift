//
//  TaskRowView.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 12.02.2025.
//

import SwiftUI

struct TaskRowView: View {
    @Bindable var task: Task
    @Environment(\.modelContext) private var context
    var body: some View {
        HStack(alignment: .center,spacing: 8) {
            Image(systemName: task.icon)
                .font(.system(size: 20))
                .foregroundStyle(task.tintColor)
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
                
                Checkbox(isChecked: $task.completed, tintColor: task.tintColor)
            }
        }
        .hSpacing(.leading)
        .background(.red)
        .contextMenu {
            Button("Delete Task") {
                context.delete(task)
                try? context.save()
            }
        }

    }
}

//#Preview {
////    TaskRowView(task: <#Task#>)
//}
