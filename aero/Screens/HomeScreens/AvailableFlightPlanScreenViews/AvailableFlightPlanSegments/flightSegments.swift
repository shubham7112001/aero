//
//  flightSegments.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct AvailableFlightPlanFlightSegment : AppSegmentedPickerItem{
    var id: Self { self }
    var displayName: String

    static let all: [AvailableFlightPlanFlightSegment] = [
        AvailableFlightPlanFlightSegment(displayName: "Aircraft reg."),
        AvailableFlightPlanFlightSegment(displayName: "Crew code"),
        AvailableFlightPlanFlightSegment(displayName: "ICAO / IATA")
    ]
}
