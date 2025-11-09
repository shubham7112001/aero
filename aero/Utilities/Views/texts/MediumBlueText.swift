//
//  BoldBlueText.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct MediumBlueText: View {
    var text : String
    var body: some View {
        Text(text)
            .font(AppFonts.defaultText)
            .foregroundStyle(.blue)
            .fontWeight(.medium)
    }
}

#Preview {
    MediumBlueText(text: "Bold")
}
