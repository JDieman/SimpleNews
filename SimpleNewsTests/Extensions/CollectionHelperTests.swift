//
//  CollectionHelperTests.swift
//  SimpleNewsTests
//
//  Created by Dmitry Polyakov on 20/02/2019.
//  Copyright © 2019 Dmitry Polyakov. All rights reserved.
//

import XCTest
@testable import SimpleNews

class CollectionHelperTests: XCTestCase {

    private let values = [0, 1, 2, 3]

    func testExample() {
        for index in -1...values.count {
            guard index >= 0 && index < values.count else {
                XCTAssertNil(values[safe: index], "Out of index")
                continue
            }
            XCTAssertNotNil(values[safe: index])
        }
    }

}
