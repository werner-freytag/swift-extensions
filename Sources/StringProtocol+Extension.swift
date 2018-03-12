//
//  Copyright © 2016 - 2018 Werner Freytag. All rights reserved.
//

import Foundation

extension StringProtocol where Index == String.Index {
    public subscript(range: CountablePartialRangeFrom<Int>) -> Self.SubSequence {
        return self[index(startIndex, offsetBy: range.lowerBound)...]
    }
    
    public subscript(range: CountableRange<Int>) -> Self.SubSequence {
        return self[index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(range: CountableClosedRange<Int>) -> Self.SubSequence {
        return self[index(startIndex, offsetBy: range.lowerBound)...index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(range: PartialRangeUpTo<Int>) -> Self.SubSequence {
        return self[..<index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(range: PartialRangeThrough<Int>) -> Self.SubSequence {
        return self[...index(startIndex, offsetBy: range.upperBound)]
    }
    
    public subscript(index: Int) -> Self.SubSequence {
        return self[index...index]
    }
}

extension StringProtocol where Index == String.Index {
    public func commonSuffix<T: StringProtocol>(with aString: T, options: String.CompareOptions = []) -> String {
        let reversedSuffix = String(reversed()).commonPrefix(with: String(aString.reversed()), options: options)
        return String(reversedSuffix.reversed())
    }
}

extension StringProtocol where Index == String.Index {
    public func camelcased() -> String {
        let str = replacingOccurrences(of: "[0-9]+", with: " $0 ", options: .regularExpression)
        
        return str.components(separatedBy: CharacterSet.alphanumerics.inverted).map {
            $0.prefix(1).uppercased() + $0.dropFirst()
        }.joined()
    }
}