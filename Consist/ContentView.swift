//
//  ContentView.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 11.02.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("isIntroCompleted") private var isIntroCompleted: Bool = false
    var body: some View {
        ZStack{
            if isIntroCompleted {
                HomeView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.BG)
                    .preferredColorScheme(.light)
                    .transition(.scale)
            } else {
                IntroPageView()
                    .transition(.scale)
            }
        }
        .animation(.snappy(duration: 0.25,extraBounce: 0), value: isIntroCompleted)
    }
}

#Preview {
    ContentView()
}
