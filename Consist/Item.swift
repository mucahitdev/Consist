//
//  Item.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 11.02.2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
