//
//  DateExtensions+.swift
//  GitStars
//
//  Created by Edson iMAC on 25/01/2019.
//  Copyright © 2019 Edson Moura. All rights reserved.
//

import Foundation

extension Date {
    static func fromString(_ stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSSZ"
        guard let date = dateFormatter.date(from: stringDate) else { fatalError("Couldn't parse date") }
        return date
    }
    
    //Example: 16/Out
    var abbreviatedDayAndMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MMM"
        return dateFormatter.string(from: self)
    }
    
    //Example: 10h34
    var commercialTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH'h'mm"
        return dateFormatter.string(from: self)
    }
    
    //Example: 10H34
    var abbreviatedYearMonthDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    //Example: 06/Jun, 20:30
    var dayMonthAndTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MMM, hh'H"
        return dateFormatter.string(from: self)
    }
    
    //Qui, 13 jun
    var dayWeekDayAndMonth: String {
        let locale = Locale(identifier: "pt_BR")
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = "EE, dd MMM"
        return dateFormatter.string(from: self)
    }
    
    var dayMonthAndWeekDay: String {
        let locale = Locale(identifier: "pt_BR")
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = "dd MMM, EEEE"
        return dateFormatter.string(from: self)
    }
    
    var weekdayDayAndMonth: String {
        let locale = Locale(identifier: "pt_BR")
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = "EEEE, dd 'de' MMMM 'de' YYYY"
        return dateFormatter.string(from: self)
    }
}
