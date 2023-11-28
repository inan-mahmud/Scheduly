//
//  DateExt.swift
//  Scheduly
//
//  Created by cefalo on 28/11/23.
//

import Foundation

extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    func startOfNextMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.date(byAdding: .month, value: 1, to: Calendar.current.startOfDay(for: self))!))!
    }
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    func endOfNextMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfNextMonth())!
    }
}
