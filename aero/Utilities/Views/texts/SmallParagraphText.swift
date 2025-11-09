//
//  SmallParagraphText.swift
//  taillog
//
//  Created by Shubham Tiwari on 02/01/25.
//

import SwiftUI

struct SmallParagraphText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(AppFonts.verySmallText)
            .padding(CustomPadding.padding)
            .foregroundStyle(.black.opacity(AppConstants.defaultOpacity))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SmallParagraphText(text: "AppTexts.sampleVeryLargeText")
}
