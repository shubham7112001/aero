//
//  ConversionFunctions.swift
//  taillog
//
//  Created by Shubham Tiwari on 06/09/24.
//

import Foundation

class ConversionFunctions{
    static func convertNullableStringToNullableFloat(_ string: String?) -> CGFloat? {
        guard let stringValue = string else {
            return nil
        }
        
        if let doubleValue = Double(stringValue) {
            
            if floor(doubleValue) == doubleValue {

                return CGFloat(Int(doubleValue))
                
            } else {

                return CGFloat(doubleValue)
            }
        } else {
            return nil
        }
    }
}
