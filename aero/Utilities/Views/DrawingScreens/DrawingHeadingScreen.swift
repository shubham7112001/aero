//
//  DrawingHeadingScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 06/12/24.
//

import SwiftUI

struct DrawingHeadingScreen: View {
    var headingText: String?
    var height : CGFloat = Dimensions.screenHeight * 0.25
    @Binding var lines: [Line]
    @Binding var isRemove: Bool
    var body: some View {
        VStack{
            if(headingText != nil ){CapitalizedTextHalfOpacity(text: headingText ?? "")}
            ZStack {
                VStack{
                    CanvasDrawing(lines: $lines ,isRemoveDrawing: $isRemove)
                }
                
                VStack {
                    CustomHeightSpacer(height: Dimensions.defaultPadding)
                    HStack{
                        Spacer()
                        Button{
                            
                            isRemove = true
                        }label:{
                            Image(systemName: SFIcons.trash)
                                .font(AppFonts.defaultSFIcons)
                                .foregroundStyle(.black)
                        }
                        itemSpacingWidth()
                    }
                    
                    Spacer()
                }
                
            }
            .frame(height: height)
            .background()
            
            
        }
    }
}

//#Preview {
//    DrawingHeadingScreen()
//}
