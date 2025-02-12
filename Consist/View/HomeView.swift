//
//  HomeView.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 11.02.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentDate = Date()
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State private var currentWeekIndex = 1
    @State private var createWeek = false

    @Namespace private var animation
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView()
            
            ScrollView() {
                VStack {
                    Text("Today")
                        .font(.title3.bold())
                        .foregroundStyle(.darkBlue)
                    Text("Today")
                        .font(.title3.bold())
                        .foregroundStyle(.darkBlue)
                }
                .hSpacing(.center)
                .vSpacing(.center)
            }
        }
        .vSpacing(.top)
        .onAppear(perform: {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                
                if let firstDate = currentWeek.first?.date {
                    weekSlider.append(firstDate.createPreviousWeek())
                }
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.createNextWeek())
                }
                    
                    
            }
                
        })
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        VStack {
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
            
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self) { index in
                    let week = weekSlider[index]
                    WeekView(week)
                        .tag(index)
                }
                .padding(.horizontal, 16)
            }
            .padding(.horizontal, -16)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 90)
                    
        }
        .padding(16)
        .hSpacing(.leading)
        .background(.white)
        .onChange(of: currentWeekIndex, initial: false) { oldValue, newValue in
            if newValue == 0 || newValue == (weekSlider.count - 1) {
                createWeek = true
            }
                
        }
    }
    
    @ViewBuilder
    func WeekView(_ week: [Date.WeekDay]) -> some View {
        HStack {
            ForEach(week) { day in
                VStack {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.semibold)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("d"))
                        .font(.callout)
                        .fontWeight(.bold)
                        .textScale (.secondary)
                        .foregroundStyle(
                            isSameDate(day.date, currentDate) ? .white : .gray
                        )
                        .frame(width: 35, height: 35)
                        .background(
                            content: {
                                if isSameDate(day.date, currentDate) {
                                    Circle()
                                        .fill(.darkBlue)
                                        .matchedGeometryEffect(
                                            id: "TABINDICATOR",
                                            in: animation
                                        )
                                }
                            
                                if day.date.isToday {
                                    Circle()
                                        .fill(.cyan)
                                        .frame(width: 5, height: 5)
                                        .vSpacing(.bottom)
                                        .offset(y: 10)
                                }
                            })
                        .background(
                            .white.shadow(.drop(radius: 1)),
                            in: .circle
                        )
                }
                .hSpacing(.center)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        currentDate = day.date
                        UIImpactFeedbackGenerator(style: .medium)
                            .impactOccurred()
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self)  { value in
                        
                        if value.rounded() == 16 && createWeek {
                            paginateWeek()
                            createWeek = false
                        }
                            
                        
                    }
            }
        }
    }
    
    func paginateWeek() {
        if weekSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (
                weekSlider.count - 1
            ) {
                weekSlider.append(lastDate.createNextWeek())
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
            
        }
    }
}

#Preview {
    HomeView()
}
