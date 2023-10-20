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

extension String {
    
    public func asProfileImage(backgroundColors: [UIColor] = [
        UIColor.red,
        UIColor.green,
        UIColor.blue
    ], fontColor: UIColor = UIColor.white) -> UIImage {
        let label = UILabel()
        var words = components(separatedBy: " ").prefix(2).compactMap({ $0.first }).map({ "\($0)" })
        if words.count == 1 {
            if let char = Array(self)[safe: 1] {
                words.append("\(char)")
            }
        }
        label.text = words.joined().uppercased()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textColor = fontColor
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        view.addSubview(label)
        label.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        label.textAlignment = .center
        let random = abs(hash) % 4
        view.backgroundColor = backgroundColors[safe: random] ?? backgroundColors[0]
        return view.asImage()
    }
    
}
