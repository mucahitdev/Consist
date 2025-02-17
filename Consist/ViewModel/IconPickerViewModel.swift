//
//  IconPickerViewModel.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 13.02.2025.
//

import SwiftUI

class IconPickerViewModel: ObservableObject {
    @Published var icons: [IconItem] = []
    @Published var searchText: String = ""
    @Published var selectedIcon: String?
    @Published var selectedCategory: Category = .all

    private let currentLanguage = "tr"

    init() {
        loadIcons()
    }

    func loadIcons(){
        guard let url = Bundle.main.url(forResource: "Icons", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decodedIcons = try JSONDecoder().decode([IconItem].self, from: data)
            self.icons = decodedIcons
        } catch {
            print("Hata: \(error.localizedDescription)")
        }
    }
    
    var filteredIcons: [IconItem] {
        let filteredByCategory = selectedCategory != .all ? icons.filter { $0.categoryEnum == selectedCategory } : icons
        
        
        if searchText.isEmpty {
            return filteredByCategory
        } else {
            return icons.filter { $0.matches(query: searchText, language: currentLanguage) }
        }
    }

    func selectIcon(_ icon: String) {
        selectedIcon = icon
    }
}
