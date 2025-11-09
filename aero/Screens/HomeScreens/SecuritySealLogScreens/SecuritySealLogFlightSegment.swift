//
//  flightSegments.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct SecuritySealLogFlightSegment : AppSegmentedPickerItem {
    var id: Self { self }
    var displayName: String

    static let all: [SecuritySealLogFlightSegment] = [
        SecuritySealLogFlightSegment(displayName: "Aircraft reg."),
        SecuritySealLogFlightSegment(displayName: "ICAO / IATA")
    ]
}
