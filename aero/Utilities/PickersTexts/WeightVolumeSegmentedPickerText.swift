//
//  WeightVolumeSegmentedPickerText.swift
//  taillog
//
//  Created by Shubham Tiwari on 13/08/24.
//

import SwiftUI

struct WeightVolumeSegmentedPickerText: AppSegmentedPickerItem {
    var id: Self { self }
    var displayName: String

static let all: [WeightVolumeSegmentedPickerText] = [
    WeightVolumeSegmentedPickerText(displayName: "Weight"),
    WeightVolumeSegmentedPickerText(displayName: "Volume")
    
]
}

