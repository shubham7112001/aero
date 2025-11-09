//
//  PrimaryViewModelNavigationSplitView.swift
//  taillog
//
//  Created by Shubham Tiwari on 08/07/24.
//

import SwiftUI

struct PrimaryViewModelNavigationSplitView: View {
    var imgSF : String
    var iconBGColor : Color
    var text : String
    var isReverseSfIcons : Bool = false
    var bgColor : UIColor = UIColor.white
    var isTextWhite : Bool = false
    var isDivider : Bool = true
    
    var body: some View {
        ZStack{
            Color(bgColor)
            HStack(alignment: .top, spacing: 0){
                itemSpacingWidth()
                IconImageSquareWithBG(img: imgSF, bg: iconBGColor,isReverseSfIcon: isReverseSfIcons,size: 25)
                    .padding(CustomPadding.vPadding)
                itemSpacingWidth()
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    Text(text)
                        . font(AppFonts.defaultText)
                        .fontWeight(.regular)
                        .foregroundStyle(isTextWhite ? .white : .black)
                    Spacer()
                    if isDivider{
                        
                        Divider()
                            .frame(height: 1)
                            .padding(.trailing, Dimensions.spaceBwItems * -1)
                    }
             }
                Spacer()
            }
            .padding(CustomPadding.none)
        }
            .frame(height: Dimensions.defaultRowHeight)
    
       
    }
}

#Preview {
    PrimaryViewModelNavigationSplitView(imgSF: "moon.fill", iconBGColor: Color.yellow, text: "Hi this is text")
}
