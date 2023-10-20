//
//  Array+ChunkedTests.swift
//  
//
//  Created by Hanno Weiß on 20.10.23.
//

import XCTest
@testable import AwesomeSwiftExtensions

final class Array_ChunkedTests: XCTestCase {

    func test() throws {
        let array: [String] = ["this", "is", "a", "list", "of", "strings"]
        let chunked = array.chunked(into: 2)
        XCTAssertEqual(chunked.count, 3)
        XCTAssertEqual(chunked[0], ["this", "is"])
        XCTAssertEqual(chunked[1], ["a", "list"])
        XCTAssertEqual(chunked[2], ["of", "strings"])
    }

}
