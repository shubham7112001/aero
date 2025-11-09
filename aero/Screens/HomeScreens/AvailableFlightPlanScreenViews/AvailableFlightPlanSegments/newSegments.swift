//
//  newSegments.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct AvailableFlightPlanNewSegment : AppSegmentedPickerItem {
    var id: Self { self }
    var displayName: String

    static let all: [AvailableFlightPlanNewSegment] = [
        AvailableFlightPlanNewSegment(displayName: "New")
    ]
}
