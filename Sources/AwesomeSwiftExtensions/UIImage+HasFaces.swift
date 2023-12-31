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

import UIKit
import Vision

extension UIImage {
    
    public var hasFaces: Bool {
        let ciImage: CIImage = CIImage(cgImage: cgImage!)
        let options: [String: Any] = [CIDetectorAccuracy: CIDetectorAccuracyLow]
        let faceDetector: CIDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: options)!
        let faces: [CIFaceFeature] = faceDetector.features(in: ciImage).compactMap({ $0 as? CIFaceFeature })
        return !faces.isEmpty
    }
    
    public func hasFaces() async throws -> Bool {
        guard let cgImage = cgImage else { return false }
        return try await withCheckedThrowingContinuation({ continuation in
            let request = VNDetectFaceRectanglesRequest { (req, error) in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: req.results?.count ?? 0 > 0)
                }
            }
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try handler.perform([request])
            } catch {
                continuation.resume(throwing: error)
            }
        })
    }
}
