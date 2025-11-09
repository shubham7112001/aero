//
//  RectangularChip.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/07/24.
//

import SwiftUI

struct RectangularChip: View {
    var text: String

        var body: some View {
            Text(text)
                .padding(CustomPadding.padding)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 0.25)
                )
                .foregroundColor(.black)
                .font(AppFonts.chipFont)
        }
}

#Preview {
    RectangularChip(text: "Data to be shown here")
}
