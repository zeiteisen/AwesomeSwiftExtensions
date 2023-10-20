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

extension String {
    
    public enum ToJsonModelError: Error {
        case missingData
    }
    
    public func fileToJSON(bundle: Bundle = Bundle.main) throws -> Any {
        if let path = bundle.path(forResource: self, ofType: "json") {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            return json
        } else {
            throw ToJsonModelError.missingData
        }
    }
    
    public func fileToModel<T: Decodable>(bundle: Bundle = Bundle.main) throws -> T {
        if let path = bundle.path(forResource: self, ofType: "json") {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } else {
            throw ToJsonModelError.missingData
        }
    }
    
    public func fileToModelArray<T: Decodable>(bundle: Bundle = Bundle.main) throws -> [T] {
        if let path = bundle.path(forResource: self, ofType: "json") {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let model = try JSONDecoder().decode([T].self, from: data)
            return model
        } else {
            throw ToJsonModelError.missingData
        }
    }
    
    public func toModel<T: Decodable>() throws -> T {
        if let data = self.data(using: .utf8) {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } else {
            throw ToJsonModelError.missingData
        }
    }
    
    public func toModelArray<T: Decodable>() throws -> [T] {
        if let data = self.data(using: .utf8) {
            let model = try JSONDecoder().decode([T].self, from: data)
            return model
        } else {
            throw ToJsonModelError.missingData
        }
    }
    
    public func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
}
