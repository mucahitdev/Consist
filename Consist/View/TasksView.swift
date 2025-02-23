//
//  TasksView.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 20.02.2025.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    @Binding var currentDate: Date
    
    @Query private var tasks: [Task]
    
    init(currentDate: Binding<Date>) {
        self._currentDate = currentDate
        /// Predicate for query
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate) ?? .init()
        let predicate = #Predicate<Task> {
            return $0.creationDate >= startDate && $0.creationDate < endDate
        }
        
        let sortDescriptor = [
            SortDescriptor(\Task.creationDate, order: .reverse)
        ]
        
        self._tasks = Query(filter: predicate,sort: sortDescriptor, animation: .snappy)
    }
    
    var body: some View {
        VStack(alignment: .leading,spacing: 16) {
            ForEach(tasks) { task in
                TaskRowView(task: task)
            }
        }
        .padding([.horizontal,.bottom], 16)
        .vSpacing(.top)
        .hSpacing(.center)
        .overlay {
            if tasks.isEmpty  {
                Text("No Task Found")
                    .font(.title2)
                    .frame(height: 200)
                    .foregroundStyle(.gray)
                    
            }
        }
    }
}

#Preview {
    TasksView(currentDate: .constant(.init()))
}
