//
//  TextTruncationFunction.swift
//  taillog
//
//  Created by Shubham Tiwari on 17/07/24.
//

import Foundation

class TextFunction{
    
    static func truncateText(_ text: String, length: Int) -> String {
        if text.count > length {
            let endIndex = text.index(text.startIndex, offsetBy: length)
            return String(text[..<endIndex]) + "..."
        } else {
            return text
        }
    }
    
    static func capitalizedSlashSeparator(_ input: String) -> String {
        // Split the string by hyphen
        let components = input.split(separator: "-")
        
        if components.count == 1 {
            // If there is no hyphen, return the first character
            return String(input.prefix(1))
        } else if components.count == 2 {
            // If there is a hyphen, return the first character of each component
            let first = components[0].prefix(1)
            let second = components[1].prefix(1)
            let str =  "\(first)\(second)"
            return str.uppercased();
        }
        
        // Default return the input if it doesn't match expected patterns
        return input
    }
}
