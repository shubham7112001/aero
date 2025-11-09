//
//  IconTextHstack.swift
//  taillog
//
//  Created by Shubham Tiwari on 08/07/24.
//

import SwiftUI

struct IconTextHStack: View {
    var text: String
    var textOpacity : Bool  = false;
    var isPaddingLeft : Bool = true;
    var body: some View {
        HStack{
            itemSpacingWidth()
            DarkText(text: text)
                .opacity(textOpacity ? AppConstants.defaultOpacity : 1)
            Spacer()
            Image(systemName: SFIcons.rightChevron)
                .opacity(AppConstants.defaultOpacity)
                .padding(CustomPadding.padding)
        }
        .frame(height: Dimensions.defaultRowHeight)
        
    }
}

#Preview {
    IconTextHStack(text : "HEllo world")
}
