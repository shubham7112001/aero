//
//  SmallText.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/08/24.
//

import SwiftUI

struct SmallText: View {
    var text: String
    var body: some View {
        Text(text)
            .opacity(AppConstants.defaultOpacity)
            .font(AppFonts.mediumText)
            .padding(CustomPadding.tPadding)
    }
}

#Preview {
    SmallText(text: "Text data will be shown here")
}
