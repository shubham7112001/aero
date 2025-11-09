//
//  NotamSegmentTextOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/07/24.
//

import SwiftUI


struct NotamSegmentTextOfpScreen: AppSegmentedPickerItem {
    
    var id: Self { self }
    var displayName: String

    static let all: [NotamSegmentTextOfpScreen] = [
        NotamSegmentTextOfpScreen(displayName: AppTexts.departure),
        NotamSegmentTextOfpScreen(displayName: AppTexts.destination),
        NotamSegmentTextOfpScreen(displayName: AppTexts.alternates),
        NotamSegmentTextOfpScreen(displayName: AppTexts.adequate),
        NotamSegmentTextOfpScreen(displayName: AppTexts.firCap)
    ]
}
