//
//  LightBlueText.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct LightBlueText: View {
    var text : String
    var body: some View {
        Text(text)
            .font(AppFonts.defaultText)
            .foregroundStyle(.mainBlue)
            .fontWeight(.light)
    }
}

#Preview {
    LightBlueText(text : "TEXT")
}
