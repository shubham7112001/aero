//
//  TextTextIconHStack.swift
//  taillog
//
//  Created by Shubham Tiwari on 09/07/24.
//

import SwiftUI

struct TextTextIconHStack: View {
    var leftText : String
    var rightText : String
    var textOpacity : Bool = true
    var leftOpacity : CGFloat = 1
    var padding : EdgeInsets = CustomPadding.padding
    var height : CGFloat = Dimensions.defaultRowHeight
    var isIcon: Bool = true
    
    var body: some View {
        VStack{
            HStack{
                DarkText(text: leftText)
                    .opacity(leftOpacity)
                    
                Spacer()
                DarkText(text: rightText)
                    
                    .opacity(textOpacity ? AppConstants.defaultOpacity : 1)
                if(isIcon){
                    Image(systemName: SFIcons.rightChevron)
                        .opacity(AppConstants.defaultOpacity)
                }
            }
        }
        .padding(padding)
        .background(.white)
        .frame(height: height)

    }
}

#Preview {
    TextTextIconHStack(leftText: "LEft Text", rightText: "Right text")
}
