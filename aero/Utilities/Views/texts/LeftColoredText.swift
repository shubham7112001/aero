//
//  LeftColoredText.swift
//  taillog
//
//  Created by Sword Software on 09/07/24.
//

import SwiftUI

struct LeftColoredText: View {
    var text : String
    var color : Color = Color.white
    var height : CGFloat = Dimensions.defaultRowHeight
    var bgColor : Color = Color.white
    var opacity : CGFloat = 1
    var font : Font?
    var body: some View {
        HStack{
            Text(text)
                .font(font ?? AppFonts.defaultText)
                .foregroundStyle(color)
                .fontWeight(.light)
            Spacer()
        }
        .padding(CustomPadding.padding)
        .frame(height: height)
        .background(bgColor)
    }
}

#Preview {
    LeftColoredText(text : "HEllo world", color: .blue)
}
