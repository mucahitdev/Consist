//
//  Date+Extensions.swift
//  Consist
//
//  Created by Mücahit Kökdemir NTT on 11.02.2025.
//

import SwiftUI

extension Date {
    func format(_ format:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    var isToday:Bool {
        Calendar.current.isDateInToday(self)
    }
    
    func fetchWeek(_ date:Date = .init()) -> [WeekDay] {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        
        var week:[WeekDay] = []
        let weekForDate = calendar.dateInterval(
            of: .weekOfMonth,
            for: startOfDay
        )
        guard let startOfWeek = weekForDate?.start else { return [] }
        
        (0..<7).forEach { index in
            if let weekDay = calendar.date(
                byAdding: .day,
                value: index,
                to: startOfWeek
            ) {
                week.append(.init(date: weekDay))
            }
        }
        
        return week
    }
    
    func createNextWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfLastDay = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDay) else {
            return []
        }
        
        return fetchWeek(nextDate)
    }
    
    func createPreviousWeek() -> [WeekDay] {
        let calendar = Calendar.current
        let startOfFirstDay = calendar.startOfDay(for: self)
        guard let previousDate = calendar.date(byAdding: .day, value: -1, to: startOfFirstDay) else {
            return []
        }
        
        return fetchWeek(previousDate)
    }
    
    
    struct WeekDay:Identifiable {
        var id = UUID()
        var date:Date
    }
}

