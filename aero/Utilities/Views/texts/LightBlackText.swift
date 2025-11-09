//
//  LightBlackText.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct LightBlackText: View {
    var text : String
    var body: some View {
        Text(text)
            .font(AppFonts.defaultText)
            .fontWeight(.light)
    }
}

#Preview {
    LightBlackText(text: "Datea")
}
