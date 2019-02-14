//
//  DateHelper.swift
//  SimpleNews
//
//  Created by Dmitry Polyakov on 14/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import Foundation

extension Date {

    init?(string: String?) {
        guard let string = string else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "MSK")
        guard let date = dateFormatter.date(from: string) else { return nil }
        self = date
    }
    
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: self)
        
    }
    
}
