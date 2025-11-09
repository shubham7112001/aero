//
//  statusSegments.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct SecuritySealLogStatusSegment : AppSegmentedPickerItem {
    var id: Self { self }
    var displayName: String

    static let all: [SecuritySealLogStatusSegment] = [
        SecuritySealLogStatusSegment(displayName: "All"),
        SecuritySealLogStatusSegment(displayName: "Pending"),
        SecuritySealLogStatusSegment(displayName: "Completed"),
        SecuritySealLogStatusSegment(displayName: "Broken"),
    ]
}
