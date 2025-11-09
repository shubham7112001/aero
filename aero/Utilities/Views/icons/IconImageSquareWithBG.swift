//
//  IconImageSquareWithBG.swift
//  taillog
//
//  Created by Sword Software on 08/07/24.
//

import SwiftUI

struct IconImageSquareWithBG: View {
    var img : String
    var bg : Color
    var isReverseSfIcon : Bool = false
    var size : CGFloat = 30
    var cornerRadii : CGFloat = 5
    
    var iconColor : Color = .white
    var body: some View {
        Rectangle()
            .fill(bg)
            .frame(width: size, height: size)
            .cornerRadius(cornerRadii)
            .overlay(
                isReverseSfIcon
                  ?  HorizontalReverseSFSymbol(sysImg: img)
                        .foregroundColor(iconColor)
                        .padding(CustomPadding.padding)
                        .toAnyView()
                :
                    
                    Image(systemName: img)
                        .foregroundColor(iconColor)
                        .padding(CustomPadding.padding)
                        .toAnyView()
                
                )
    }
}

#Preview {
    IconImageSquareWithBG(img:"moon.fill", bg:Color(.red))
}
