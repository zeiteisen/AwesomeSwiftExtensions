//
// AwesomeSwiftExtensions
//
// Copyright (c) 2023-present Hanno Weiss
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation
import UIKit

extension UIImagePickerController.CameraCaptureMode: Codable {

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let intValue = try? container.decode(Int.self) {
            if let value = UIImagePickerController.CameraCaptureMode(rawValue: intValue) {
                self = value
            } else {
                self = .photo
            }
        } else if let stringValue = try? container.decode(String.self) {
            if stringValue == "video" {
                self = .video
            } else {
                self = .photo
            }
        } else {
            self = .photo
        }
    }
    
}

extension UIImagePickerController.QualityType: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let intValue = try? container.decode(Int.self) {
            if let value = UIImagePickerController.QualityType(rawValue: intValue) {
                self = value
            } else {
                self = .typeLow
            }
        } else if let stringValue = try? container.decode(String.self) {
            if stringValue == "high" {
                self = .typeHigh
            } else if stringValue == "medium" {
                self = .typeMedium
            } else {
                self = .typeLow
            }
        } else {
            self = .typeLow
        }
    }
    
}
