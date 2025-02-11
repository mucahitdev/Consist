//
//  HomeView.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 11.02.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var currentDate = Date()
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView()
        }
        .vSpacing(.top)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(currentDate.format("MMM"))
                        .foregroundStyle(.darkBlue)
                    HStack(spacing: 0) {
                        Text("20")
                        Text(currentDate.format("YY"))
                            .foregroundStyle(.darkBlue)
                    }
                }
                .font(.title.bold())
                
                Text(currentDate.formatted(date: .complete, time: .omitted))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .textScale(.secondary)
                    .foregroundStyle(.gray)
                
            }
            Spacer()
            Button(action: {}, label: {
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            })
        }
        .padding(16)
        .hSpacing(.leading)
        .background(.white)
    }
}

#Preview {
    HomeView()
}
