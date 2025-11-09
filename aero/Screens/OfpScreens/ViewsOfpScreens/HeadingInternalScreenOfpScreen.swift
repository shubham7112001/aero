//
//  HeadingInternalScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 17/07/24.
//

import SwiftUI

struct HeadingInternalScreenOfpScreen: View {
    var leftText: String
    var centerText : String
    var actions  : [AnyView] = []
    var width : CGFloat = Dimensions.navigationSplitViewDetailWidth
    var height : CGFloat = Dimensions.ofpHeadingHeight
    var bgColor : Color = .lightAccentBlue
    var leftTxtColor : Color = .dWhite
    var centerTxtColor : Color = .dWhite
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Rectangle()
            .fill(bgColor)
            .overlay(
                ZStack{
                    HStack{
                        itemSpacingWidth()
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        }label: {
                            HStack(spacing : 0){
                                Image(systemName: SFIcons.leftChevron)
                                    .foregroundStyle(leftTxtColor)
                                Text(TextFunction.truncateText(leftText, length: 7))
                                    .foregroundStyle(leftTxtColor)
                                    .font(AppFonts.mediumText)
                                    .truncationMode(.tail)
                                    .lineLimit(1)
                            }
                        }
                        
                        Spacer()
                        
                        
                        
                        HStack{
                            ForEach(actions.indices, id : \.self){index in
                                actions[index]
                            }
                        }
                        itemSpacingWidth()
                    }
                    Text(TextFunction.truncateText(centerText, length: 60))
                        .foregroundStyle(centerTxtColor)
                        .font(AppFonts.mediumText)
                        .truncationMode(.head)
                        .lineLimit(1)
                        .frame(alignment: .center)
                }
                
                
            )
            .frame(width: Dimensions.navigationSplitViewDetailWidth,height: Dimensions.ofpHeadingHeight)
    }
    
}

#Preview {
    HeadingInternalScreenOfpScreen(leftText: "Left Texteft Texteft Texteft Texteft Text", centerText: "Centered Text eft Texteft Textef")
}
