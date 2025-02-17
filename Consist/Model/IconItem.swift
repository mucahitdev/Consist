//
//  IconItem.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 13.02.2025.
//

import Foundation

struct IconItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let labels: [String: [String]]
    let category: Int

    private enum CodingKeys: String, CodingKey {
        case name, labels, category
    }
    
    var categoryEnum: Category? {
           return Category(rawValue: category)
       }

    func matches(query: String, language: String) -> Bool {
        guard let localizedLabels = labels[language] else { return false }
        return name
            .contains(query.lowercased()) || localizedLabels
            .contains(where: { $0.contains(query.lowercased()) })
    }
}

enum Category: Int, CaseIterable, Codable {
    case all = 0
    case health = 1
    case fitness = 2
    case home = 3
    case nature = 4
    case security = 5
    case travel = 6
    case media = 7
    case office = 8
    case personal = 9
    case search = 10
    case celebration = 11
    case photography = 12
    case literature = 13

    var name: String {
        switch self {
        case .all:
            return "Tümü"
        case .health:
            return "Sağlık"
        case .fitness:
            return "Spor"
        case .home:
            return "Ev"
        case .nature:
            return "Doğa"
        case .security:
            return "Güvenlik"
        case .travel:
            return "Seyahat"
        case .media:
            return "Medya"
        case .office:
            return "Ofis"
        case .personal:
            return "Kişisel"
        case .search:
            return "Arama"
        case .celebration:
            return "Kutlama"
        case .photography:
            return "Fotoğrafçılık"
        case .literature:
            return "Edebiyat"
        }
    }
}

