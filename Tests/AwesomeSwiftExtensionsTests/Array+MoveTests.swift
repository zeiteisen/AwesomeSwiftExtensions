//
//  Array+MoveTests.swift
//  
//
//  Created by Hanno Weiß on 20.10.23.
//

import XCTest
@testable import AwesomeSwiftExtensions

final class Array_MoveTests: XCTestCase {

    func test() throws {
        var array: [String] = ["this", "is", "a", "list", "of", "strings"]
        array.move("strings", to: 0)
        XCTAssertEqual(array[0], "strings")
    }
    
}
