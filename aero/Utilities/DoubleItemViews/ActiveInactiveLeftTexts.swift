//
//  ActiveInactiveLeftText.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/08/24.
//

import SwiftUI

struct ActiveInactiveLeftTexts: View {
    var isActive : Bool = false;
    var unitText : String = ""
    var leftText: String
    var rightText: String = ""
    var body: some View {
        HStack(spacing : 0){
            itemSpacingWidth()
            Text(leftText)
                .font(AppFonts.defaultText)
                .opacity(isActive ? 1 : AppConstants.defaultOpacity)
                
            
            Spacer()
            
            Text(rightText)
                .font(AppFonts.defaultText)
                .opacity(AppConstants.defaultOpacity)
            
            if !unitText.isEmpty {
                Text(" \(unitText)")
                    .font(AppFonts.defaultText)
                    .opacity(AppConstants.defaultOpacity)
            }
            
            CustomWidthSpacer(width: Dimensions.defaultPadding / 2)
            
            if isActive == true {
                Image(systemName: SFIcons.rightChevron)
                    .opacity(AppConstants.defaultOpacity)
                    .font(AppFonts.defaultText)
            }
            itemSpacingWidth()
        }
        .frame(height: Dimensions.defaultRowHeight)
        .background(.white)
        
    }
}

#Preview {
    ActiveInactiveLeftTexts(isActive: true, unitText: "lb", leftText: "Data to be privederada here")
}
