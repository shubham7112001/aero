//
//  StringToDateObjects.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/07/24.
//

import Foundation

class DateTimeFunctions {
    
    static func stringToDate(_ str: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: str)
    }
    
    static func dateTimeReadable(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        return dateFormatter.string(from: date).uppercased()
    }
    
    static func onlyDateReadable(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date).uppercased()
    }
    
    static func onlyTimeReadable(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    static func differenceInHours(from date: Date) -> Int {
        let currentDate = Date()
        let calendar = Calendar.current

        let daysDifference = calendar.dateComponents([.day], from: date, to: currentDate).day ?? 0
        
        let hoursDifference = daysDifference * 24

        return hoursDifference
    }
    
    static func addTime(timeDate: Date, dateWithDate: Date) -> Date {
        let calendar = Calendar.current

        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: timeDate)

        var newDateComponents = calendar.dateComponents([.year, .month, .day], from: dateWithDate)
        newDateComponents.hour = timeComponents.hour
        newDateComponents.minute = timeComponents.minute
        newDateComponents.second = timeComponents.second

        if let newDate = calendar.date(from: newDateComponents) {
                return newDate
            } else {
                return Date()
            }
    }
}

