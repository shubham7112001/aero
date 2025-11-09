//
//  DestinationDepartureAppPickerItem.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/08/24.
//

import SwiftUI


    struct DestinationDepartureSegmentedPickerText: AppSegmentedPickerItem {
        var id: Self { self }
        var displayName: String

    static let all: [DestinationDepartureSegmentedPickerText] = [
        DestinationDepartureSegmentedPickerText(displayName: "Destination"),
        DestinationDepartureSegmentedPickerText(displayName: "Departure")
        
    ]
    }
