//
//  OffsetKey.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 12.02.2025.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
