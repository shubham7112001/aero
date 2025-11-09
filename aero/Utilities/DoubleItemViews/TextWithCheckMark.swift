//
//  TextWIthCheckMark.swift
//  taillog
//
//  Created by Shubham Tiwari on 12/08/24.
//

import SwiftUI

struct TextWithCheckMark: View {
    var text: String;
    var isCheckmark: Bool? = false
    var body: some View {
        HStack{
            Text(text)
                .foregroundStyle(.black)
                .font(AppFonts.defaultText)
            Spacer()
            
            if isCheckmark == true {
                Image(systemName: SFIcons.checkmark)
                    .foregroundStyle(.mainBlue)
                    .fontWeight(.heavy)
            }
        }
        .frame(height: Dimensions.defaultRowHeight)
        .padding(CustomPadding.hPadding)
        .background(.dWhite)
    }
}

#Preview {
    TextWithCheckMark(text: "Some data", isCheckmark: true)
}
