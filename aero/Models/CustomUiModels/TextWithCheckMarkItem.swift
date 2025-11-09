//
//  TextWithCheckMarkItem.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/08/24.
//

import SwiftUI

struct TextWithCheckMarkItem : Identifiable {
        let id = UUID()
        let text: String
        var isCheckmark: Bool
    }

