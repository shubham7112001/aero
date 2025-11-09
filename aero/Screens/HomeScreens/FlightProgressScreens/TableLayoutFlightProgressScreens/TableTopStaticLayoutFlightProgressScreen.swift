//
//  TableTopStaticLayoutFlightProgressScreen.swift
//  taillog
//
//  Created by Sword Software on 28/06/24.
//

import SwiftUI

struct TableTopStaticLayoutFlightProgressScreen : View {
        
    let height = Dimensions.flightProgressTableRowHeight * 0.8
        var body: some View {
            ZStack{
                Color(.lightGrey)
                VStack(spacing: 0){
                    Divider()
                        .frame(height: 1)
                        .background(Color.white)
                    
                    HStack(spacing: 0){
                        HStack(spacing: 0){
                            CustomWidthSpacer(width: Dimensions.defaultPadding)
                            LightWhiteText(text:  "Segment",font: AppFonts.mediumText)
                            Spacer()
                            
                            VerticalDivider(height: height,color: .white)
                        }
                        .frame(width: Dimensions.screenSize.width * 0.26 )
                        
                        HStack(spacing : 0){
                            CustomWidthSpacer(width: Dimensions.defaultPadding )
                            LightWhiteText(text:  "Waypoint & Time",font: AppFonts.mediumText)
                            Spacer()
                            
                            VerticalDivider(height: height,color: .white)
                        }
                        .frame(width: Dimensions.screenSize.width * 0.38)
                        
                        
                        HStack(spacing : 0){
                            CustomWidthSpacer(width: Dimensions.defaultPadding)
                            LightWhiteText(text:  "Speed & Wind",font: AppFonts.mediumText)
                            Spacer()
                            
                            VerticalDivider(height: height,color: .white)
                        }
                        .frame(width: Dimensions.screenSize.width * 0.22)
                        
                        
                        HStack(spacing : 0){
                            CustomWidthSpacer(width: Dimensions.defaultPadding)
                            LightWhiteText(text:  "Fuel",font: AppFonts.mediumText)
                            Spacer()
                        }
                        .frame(width: Dimensions.screenSize.width * 0.14)
                        
                    }
                }
                
            }
            .frame(height: height)
        }
}

#Preview {
    TableTopStaticLayoutFlightProgressScreen()
}
