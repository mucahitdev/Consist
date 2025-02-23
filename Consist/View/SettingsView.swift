//
//  SettingsView.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 20.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("isIntroCompleted") private var isIntroCompleted: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Profile") {
                    HStack(spacing: 12) {
                        Image("Pic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("User Name")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("Settings & Privacy")
                                .font(.callout)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                Section("General") {
                    NavigationLink {
                        Text("Notifications")
                    } label: {
                        Label("Notifications", systemImage: "bell")
                    }
                    
                    NavigationLink {
                        Text("Appearance")
                    } label: {
                        Label("Appearance", systemImage: "paintbrush")
                    }
                }
                
                Section("About") {
                    NavigationLink {
                        Text("Version")
                    } label: {
                        Label("Version 1.0.0", systemImage: "info.circle")
                    }
                }
                
                Button {
                    isIntroCompleted = false
                } label: {
                    Label("Reset Intro", systemImage: "arrow.counterclockwise")
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
} 
