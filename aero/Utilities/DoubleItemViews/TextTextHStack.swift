//
//  TextTextHStack.swift
//  taillog
//
//  Created by Shubham Tiwari on 08/07/24.
//

import SwiftUI

struct TextTextHStack: View {
    var leftText: String
    var rightText: String
    var extraText : String = "";
    var leftOpacity : Bool  = false;
    var rightOpacity : Bool  = false;
    var font: Font = AppFonts.defaultText
    var textColor: Color = .black
    var leftTextColor: Color? = nil
    var rightTextColor: Color? = nil
    var body: some View {
        
        VStack(spacing: 0){
            HStack{
                Text(leftText)
                    .font(font)
                    .foregroundStyle(leftTextColor != nil ? leftTextColor! : textColor)
                    .padding(CustomPadding.none)
                    .opacity(leftOpacity ? AppConstants.defaultOpacity : 1)
                
                if(!extraText.isEmpty){
                    Text("(\(extraText))")
                        .font(font)
                        .foregroundStyle(textColor)
                        .padding(CustomPadding.none)
                        .opacity(AppConstants.defaultOpacity)
                }
                Spacer()
                Text(rightText)
                    .font(font)
                    .foregroundStyle(rightTextColor != nil ? rightTextColor! : textColor)
                    .padding(CustomPadding.none)
                    .opacity(rightOpacity ? AppConstants.defaultOpacity : 1)
            }
            .padding(CustomPadding.padding)

        }
        .background(.white)
        .frame(height: Dimensions.defaultRowHeight)
    }
    
}

#Preview {
    TextTextHStack(leftText: "Left Text", rightText: "Right Text",rightOpacity: true, leftTextColor: .mainBlue)
}
