//
//  CenteredColorText.swift
//  taillog
//
//  Created by Sword Software on 09/07/24.
//

import SwiftUI

struct CenteredColorText: View {
    var text : String
    var color : Color = Color.white
    var height : CGFloat = Dimensions.defaultRowHeight
    var body: some View {
        HStack{
            Spacer()
            Text(text)
                .font(AppFonts.defaultText)
                .foregroundStyle(color)
                .fontWeight(.light)
            Spacer()
        }
        .frame(height: height)
        .background()
    }
}

#Preview {
    CenteredColorText(text: "Hello world")
}
