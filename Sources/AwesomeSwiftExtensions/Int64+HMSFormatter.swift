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

extension Int64 {
    
    public func secondsToHoursMinutesSeconds() -> (Int64, Int64, Int64) {
      return (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
    
    public func hmsParts() -> (String, String, String) {
        let hms = secondsToHoursMinutesSeconds()
        let hour = String(format: "%02d", hms.0)
        let minutes = String(format: "%02d", hms.1)
        let seconds = String(format: "%02d", hms.2)
        return (hour, minutes, seconds)
    }
    
    public func hmsString() -> String {
        let hms = secondsToHoursMinutesSeconds()
        var parts: [String] = []
        parts.append(String(format: "%02d", hms.0))
        parts.append(String(format: "%02d", hms.1))
        parts.append(String(format: "%02d", hms.2))
        return parts.joined(separator: ":")
    }
    
}
