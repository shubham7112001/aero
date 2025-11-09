//
//  CornerCombinations.swift
//  taillog
//
//  Created by Shubham Tiwari on 19/12/24.
//

import Foundation
import SwiftUI

class CornerCombinations{
    static let topLeft: UIRectCorner = .topLeft
    static let topRight: UIRectCorner = .topRight
    static let bottomLeft: UIRectCorner = .bottomLeft
    static let bottomRight: UIRectCorner = .bottomRight
    static let top: UIRectCorner = [.topLeft, .topRight]
    static let bottom: UIRectCorner = [.bottomLeft, .bottomRight]
    static let left: UIRectCorner = [.topLeft, .bottomLeft]
    static let right: UIRectCorner = [.topRight, .bottomRight]
    static let all: UIRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
    static let topLeftBottomRight: UIRectCorner = [.topLeft, .bottomRight]
    static let topRightBottomLeft: UIRectCorner = [.topRight, .bottomLeft]
}
