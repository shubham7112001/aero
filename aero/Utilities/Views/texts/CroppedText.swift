//
//  CroppedText.swift
//  taillog
//
//  Created by Shubham Tiwari on 02/12/24.
//

import SwiftUI

struct CroppedText: View {
    var text: String
    var textColor: Color?
    var font: Font = AppFonts.defaultText
    
    var body: some View {
        Text(text)
            .font(font)
            .lineLimit(1)
            .hidden()
            .overlay(alignment: .leading) {
                Text(text)
                    .font(font)
                    .foregroundStyle(textColor ?? .white)
                    .lineLimit(1)
                    .fixedSize()
            }
            .foregroundStyle(textColor ?? .white)
    }
}
