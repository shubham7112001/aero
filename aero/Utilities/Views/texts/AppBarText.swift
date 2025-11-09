//
//  AppBarText.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct AppBarText: View {
    var text : String
    var font : Font = AppFonts.defaultText
    var body: some View {
        Text(text)
            .font(font)
            .padding(CustomPadding.padding)
            .frame(height: Dimensions.iconSize)
            .foregroundStyle(.white)
    }
}

#Preview {
    ZStack{
        Color(.red)
        AppBarText(text: "TEXT")
    }
    
}
