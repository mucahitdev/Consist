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
                    .transition(.move(edge: .trailing))
            } else {
                IntroPageView()
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.snappy(duration: 0.25,extraBounce: 0), value: isIntroCompleted)
    }
}

#Preview {
    ContentView()
}
