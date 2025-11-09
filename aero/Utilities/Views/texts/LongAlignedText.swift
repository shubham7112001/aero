//
//  LongAlignedText.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct LongAlignedText: View {
    var text : String;
    var leftAlign : Bool = true;
    var body: some View {
        Text(text)
            .foregroundStyle(.black)
            .padding(CustomPadding.lPadding)
            .opacity(AppConstants.defaultOpacity)
            .multilineTextAlignment(leftAlign ? .leading : .trailing)
            .font(AppFonts.defaultText)
    }
}

#Preview {
    LongAlignedText(text : AppTexts.sampleVeryLargeText)
}
