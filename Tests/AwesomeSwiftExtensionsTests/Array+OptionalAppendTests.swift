//
//  Array+OptionalAppendTests.swift
//  
//
//  Created by Hanno Weiß on 20.10.23.
//

import XCTest
@testable import AwesomeSwiftExtensions

final class Array_OptionalAppendTests: XCTestCase {

    func test() throws {
        var array: [String] = ["this", "is", "a", "list", "of", "strings"]
        array.append(optionalElement: nil)
        XCTAssertEqual(array.count, 6)
        array.append(optionalElement: "!!!")
        XCTAssertEqual(array.count, 7)
    }

}
