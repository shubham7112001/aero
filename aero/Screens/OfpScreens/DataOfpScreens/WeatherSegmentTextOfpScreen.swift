//
//  WeatherSegmentTextOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 11/07/24.
//

import SwiftUI

struct WeatherSegmentTextOfpScreen: AppSegmentedPickerItem {
    
    var id: Self { self }
    var displayName: String

    static let all: [WeatherSegmentTextOfpScreen] = [
        WeatherSegmentTextOfpScreen(displayName: AppTexts.departure),
        WeatherSegmentTextOfpScreen(displayName: AppTexts.destination),
        WeatherSegmentTextOfpScreen(displayName: AppTexts.alternates)
    ]
}
