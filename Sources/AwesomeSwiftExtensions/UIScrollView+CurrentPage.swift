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

extension UIScrollView {
    
    public var currentPage: Int? {
        if frame.width > 0 {
            return Int((contentOffset.x + (0.5 * frame.size.width)) / frame.width)
        }
        return nil
    }
    
    public func scrollToNextPage() {
        var frame = frame
        let page = currentPage ?? 0
        let x = frame.size.width * CGFloat(page + 1)
        if !(x + frame.width > contentSize.width) {
            frame.origin.x = x
            scrollRectToVisible(frame, animated: true)
        }
    }
    
    public func scrollToPage(page: Int, animated: Bool = true) {
        var frame = frame
        let x = frame.size.width * CGFloat(page)
        if !(x + frame.width > contentSize.width) {
            frame.origin.x = x
            scrollRectToVisible(frame, animated: animated)
        }
    }
    
}
