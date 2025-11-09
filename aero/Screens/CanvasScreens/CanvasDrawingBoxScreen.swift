//
//  CanvasDrawingBoxScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/09/24.
//

import SwiftUI

struct CanvasDrawingBoxScreen: View {
    @Binding  var lines: [Line]
    @Binding var isRemoveDrawing: Bool
    
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
            VStack(spacing: 0){
                
                HeadingInternalScreenOfpScreen(leftText: AppTexts.preFlightAcceptance, centerText: "Checklist item")
                ScrollView{
                    VStack(spacing : 0){
                        sectionSpacing()
                        
                        ZStack{
                            
                            CanvasDrawing(lines: $lines, isRemoveDrawing: $isRemoveDrawing)
                            VStack {
                                CustomHeightSpacer(height: Dimensions.defaultPadding)
                                HStack{
                                    Spacer()
                                    Button{
                                        
                                        isRemoveDrawing = true
                                    }label:{
                                        Image(systemName: SFIcons.trash)
                                            .font(AppFonts.defaultSFIcons)
                                            .foregroundStyle(.black)
                                    }
                                    itemSpacingWidth()
                                }
                                
                                Spacer()
                            }
//                            CanvasDrawing(lines: $lines, isRemoveDrawing: $isRemoveDrawing)
                        }
                        .frame(height: Dimensions.singleViewBoxHeight)
                        .background(.dWhite)
                        
                           
                    }
                    
                }
            }
            
        }
        .navigationBarBackButtonHidden()
    }
}

//#Preview{
//    @State  var lines: [Line] =
//    CanvasDrawingBoxScreen(lines: .constant, isRemoveDrawing: $lines, isRemoveDrawing : .constant(true))
//}

