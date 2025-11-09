//
//  DarkText.swift
//  taillog
//
//  Created by Shubham Tiwari on 14/08/24.
//

import SwiftUI

struct DarkText : View {
    var text : String
    var isBlack : Bool = true
    var font: Font?
    var fontWeight : Font.Weight?
    var body: some View {
        Text(text)
            . font(font ?? AppFonts.defaultText)
        
            .fontWeight(fontWeight ?? .regular)
            .foregroundStyle(isBlack ? .black : .white)
            .padding(CustomPadding.none)
    }
}


