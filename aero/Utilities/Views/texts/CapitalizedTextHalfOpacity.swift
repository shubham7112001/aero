//
//  CapitalizedText.swift
//  taillog
//
//  Created by Shubham Tiwari on 09/07/24.
//

import SwiftUI

struct CapitalizedTextHalfOpacity: View {
    var text : String
    var opacity : CGFloat = AppConstants.defaultOpacity
    var font: Font = AppFonts.smallText
    var isCapitalized : Bool = true;
    
    var body: some View {
        HStack{
            itemSpacingWidth()
            DarkText(text: isCapitalized ? text.uppercased() : text,font: font)
                .opacity(opacity)
            
            Spacer()
        }
        .padding(.bottom, CustomPadding.defaultPadding)
        
    }
}

#Preview {
    CapitalizedTextHalfOpacity(text: "hello world")
}
