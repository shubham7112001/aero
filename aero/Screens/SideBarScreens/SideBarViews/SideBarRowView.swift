//
//  SideBarRowView.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct SideBarRowView: View {
    var text : String
    var img :  IconImageContent
    var bgColor : Color?
    var rightText: String = ""
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .bottom){
                
                IconImage(content: img)
                LightBlackText(text: text)
                    .foregroundColor(.white)
                Spacer()
                if(!rightText.isEmpty){
                    LightWhiteText(text: rightText, font: AppFonts.verySmallText)
                        .padding(CustomPadding.rHalfPadding)
                }
                
            }
        }
        .padding(CustomPadding.lHalfPadding)
        .frame(width: Dimensions.sidebarWidth - Dimensions.defaultPadding ,height: Dimensions.defaultRowHeight)
        .background( bgColor ?? Color.clear)
        .roundedCorner(4, corners: CornerCombinations.all)
        
    }
}

#Preview {
    SideBarRowView(text: "data asd adsfas", img: .customImage(Image(.loadDownWhite)),bgColor: .black, rightText: "right asd")
}
