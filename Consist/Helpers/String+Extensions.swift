//
//  String+Extensions.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 20.02.2025.
//

import SwiftUI

extension String {
    var isValidString: Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
