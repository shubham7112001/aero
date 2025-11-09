//
//  TextButton.swift
//  taillog
//
//  Created by Shubham Tiwari on 05/12/24.
//

import SwiftUI

struct ButtonText: View {
    var text : String = "Click Me"
    var body: some View {
        Text(text)
            .foregroundStyle(.mainBlue)
            .font(AppFonts.mediumText)
            .fontWeight(.medium)
    }
}

#Preview {
    ButtonText()
}
