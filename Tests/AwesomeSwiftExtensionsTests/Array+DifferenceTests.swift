//
//  File.swift
//  
//
//  Created by Hanno Weiß on 20.10.23.
//

import XCTest
import Foundation
@testable import AwesomeSwiftExtensions

final class Array_DifferenceTests: XCTestCase {

    func test() throws {
        let array1: [String] = ["this", "is", "a", "list", "of", "strings"]
        let array2: [String] = ["this", "is", "different"]
        let diff = array1.difference(from: array2)
        XCTAssertEqual(Set(diff).isSubset(of: Set(["different", "a", "list", "of", "strings"])), true)
    }

}
