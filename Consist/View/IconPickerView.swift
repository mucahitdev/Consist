//
//  IconPickerView.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 13.02.2025.
//

import SwiftUI

struct IconPickerView: View {
    @StateObject private var viewModel = IconPickerViewModel()
    @Binding var selectedIcon: String
    let tint: Color
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            // 🖼 Seçili ikon gösterme
//            if let selectedIcon = viewModel.selectedIcon {
//                Image(systemName: selectedIcon)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 50, height: 50)
//                    .padding()
//            }

            // 🔍 Arama Kutusu
//            TextField("İkon ara...", text: $viewModel.searchText)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
            
            
//            ScrollView(.horizontal,showsIndicators:false) {
//                HStack {
//                    ForEach(Category.allCases, id: \.self) { category in
//                        Text(category.name)
//                            .padding(.horizontal, 12)
//                            .padding(.vertical, 8)
//                            .background(
//                                viewModel.selectedCategory == category ? Color.blue
//                                    .opacity(0.2) : Color.clear
//                            )
//                            .cornerRadius(8)
//                            .onTapGesture {
//                                viewModel.selectedCategory = category
//                            }
//                    }
//                }
//            }
            
            ScrollView {
                LazyVGrid(
                    columns: Array(repeating: GridItem(), count: 5),
                    spacing: 16
                ) {
                    ForEach(viewModel.filteredIcons) { icon in
                        Button {
                            viewModel.selectIcon(icon.name)
                            selectedIcon = icon.name
                            dismiss()
                        } label: {
                            VStack {
                                Image(systemName: icon.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(tint)
                                    .padding()
                                    .background(.ultraThinMaterial,in:Circle())
                                Text(icon.name)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                            }
                            
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
                .searchable(text: $viewModel.searchText)
                

            }
            .navigationTitle("Select Icon")
        }
        
        
    }
}


#Preview {
//    IconPickerView(tint: .constant(.taskColor1), selectedIcon: .constant("book"))
}
