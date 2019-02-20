//
//  DateTests.swift
//  SimpleNewsTests
//
//  Created by Dmitry Polyakov on 20/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import XCTest
@testable import SimpleNews

class DateHelperTests: XCTestCase {
    
    private enum DateValue: String, CaseIterable {
        
        case past, present, future
        
        var stringDate: String {
            switch self {
            case .past:
                return "2010-12-22T10:10:10+00:00"
            case .present:
                return "2019-02-18T16:14:42+00:00"
            case .future:
                return "2033-02-18T20:20:00+00:00"
            }
        }
        
        var date: Date {
            switch self {
            case .past:
                return Date(timeIntervalSince1970: 1293012610)
            case .present:
                return Date(timeIntervalSince1970: 1550506482)
            case .future:
                return Date(timeIntervalSince1970: 1992370800)
            }
        }
        
        var formattedString: String {
            switch self {
            case .past:
                return "22 декабря 2010"
            case .present:
                return "18 февраля 2019"
            case .future:
                return "18 февраля 2033"
            }
        }
        
        var description: String {
            return "Error in \(self.rawValue) case"
        }
    }

    /// Testing new Date init wth string parameter
    func testInitDateFromString() {
        
        for dateKey in DateValue.allCases {
            let result = Date(string: dateKey.stringDate)
            XCTAssertTrue(result == dateKey.date, dateKey.description)
        }
    }

    /// Testing new Date computed property "formatted"
    func testGettingFormattedStringFromDate() {
        
        for dateKey in DateValue.allCases {
            let result = dateKey.formattedString
            XCTAssertTrue(result == dateKey.date.formatted, dateKey.description)
        }
    }

}
