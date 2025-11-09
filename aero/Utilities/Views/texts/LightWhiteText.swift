//
//  LightWhiteText.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct LightWhiteText: View {
    var text : String
    var isBlack : Bool = false
    var font : Font?
    var body: some View {
        Text(text)
            .font(font ?? AppFonts.defaultText)
            .fontWeight( .light)
            .foregroundStyle(isBlack ? .black : .white)
    }
}
#Preview {
    LightWhiteText(text: "data")
}
