//
//  NewTaskView.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 13.02.2025.
//

import SwiftUI

struct NewTaskView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var taskName: String = ""
    @State private var taskDate: Date = Date()
    @State private var taskColor: Color = .taskColor1
    @State private var taskIcon: String = "pencil"
    @State private var isIconPickerPresented: Bool = false
    
    let colors: [Color] = [.taskColor1,.taskColor2,.taskColor3,.taskColor4,.taskColor5]

    var body: some View {
        VStack(alignment: .leading,spacing: 16) {
                VStack(alignment: .leading) {
                    Text("Task Title")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    HStack {
                        TextField("Task Title", text: $taskName)
                            .padding(.vertical,8)
                            .padding(.horizontal,16)
                            .background(.white.shadow(.drop(color: .black.opacity(0.25),radius: 2)),in: .rect(cornerRadius: 10))
                        Button(action: {
                            withAnimation {
                                isIconPickerPresented.toggle()
                            }
                        }) {
                            Image(systemName: taskIcon)
                                .font(.system(size: 24))
                                .foregroundStyle(taskColor)
                                .padding(8)
                                .background(Color.iconBG,in: Circle())
                        }
                    }
                }
            // Date Picker and Color Picker
            HStack {
                VStack(alignment: .leading) {
                    Text("Task Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    DatePicker("", selection: $taskDate, displayedComponents: [.date,.hourAndMinute])
                        .datePickerStyle(.compact)
                }
                
                Spacer()
                VStack(alignment: .leading) {
                    Text("Task Color")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    HStack(spacing:0) {
                        ForEach(colors, id: \.self) { color in
                            Button(action: {
                                withAnimation {
                                    taskColor = color
                                }
                            }) {
                                Circle()
                                    .fill(color)
                                    .stroke(.black,lineWidth: taskColor == color ? 1 : 0)
                                    .frame(width: 20, height: 20)
                                    .scaleEffect(taskColor == color ? 1.1 : 1)
                                    .hSpacing(.center)
                                
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Create Task")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .hSpacing(.center)
                    .padding(.vertical,8)
                    .foregroundStyle(.white)
                    .background(taskColor,in: .rect(cornerRadius: 8))
            })
            .disabled(!taskName.isValidString)
            .opacity(taskName.isValidString ? 1 : 0.5)
        }
        .padding(16)
        .background(.BG)
        .sheet(isPresented: $isIconPickerPresented) {
            IconPickerView(tint: $taskColor, selectedIcon: $taskIcon)
        }
    }
}

#Preview {
    NewTaskView()
}
