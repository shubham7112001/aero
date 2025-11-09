//
//  durationSegments.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct AvailableFlightPlanDurationSegment : AppSegmentedPickerItem {
    var id: Self { self }
    var displayName: String

    static let all: [AvailableFlightPlanDurationSegment] = [
        AvailableFlightPlanDurationSegment(displayName: "Next 6 hrs"),
        AvailableFlightPlanDurationSegment(displayName: "Next 24 hrs"),
        AvailableFlightPlanDurationSegment(displayName: "Any Period")
    ]
}
