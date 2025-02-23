//
//  Checkbox.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 12.02.2025.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isChecked: Bool
    let tintColor: Color

    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                isChecked.toggle()
                triggerHapticFeedback()
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(isChecked ? tintColor : Color.gray, lineWidth: 2)
                    .frame(width: 20, height: 20)
                    .background(
                        isChecked ? tintColor.opacity(0.2) : Color.clear
                    )
                    .cornerRadius(6)

                if isChecked {
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(tintColor)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .scaleEffect(isChecked ? 1.1 : 1.0)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func triggerHapticFeedback() {
        let generator = UINotificationFeedbackGenerator()
        if isChecked {
            generator
                .notificationOccurred(
                    .success
                )
        } else {
            let lightGenerator = UIImpactFeedbackGenerator(style: .light)
            lightGenerator.impactOccurred()
        }
    }
}

#Preview {
    Checkbox(isChecked: .constant(true), tintColor: .red )
}
