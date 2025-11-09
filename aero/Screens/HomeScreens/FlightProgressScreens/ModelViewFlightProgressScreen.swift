//
//  ModelViewFlightProgressScreen.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct ModelViewFlightProgressScreen: View {
    var height : CGFloat  = Dimensions.flightProgressTableRowHeight
    var isBlack : Bool = true;
    var bgColor : UIColor
    var isSelected : Bool = false;
    var model : FlightProgressTableModel? = nil
    var textColor : Color = .white
    
        var body: some View {
            ZStack{
                Color(bgColor)
                VStack{
                    HStack(spacing: 0){
                        HStack(spacing: 0){
                            Rectangle()
                                .foregroundStyle(model == nil ? .mainBlue : isSelected ? .orangeBorder : Color(bgColor))
                                .frame(width : Dimensions.defaultPadding / 2, height : height)
                            
                            CustomWidthSpacer(width: Dimensions.defaultPadding / 2)
                            
                            FlightProgressDoubleTextVstack(topText: model?.fir ?? AppTexts.firCap, bottomText: model?.airway ?? "Airway",color: textColor,font : AppFonts.smallText)
                                .frame(width: Dimensions.screenWidth * 0.07 - 3)
                            
                            FlightProgressDoubleTextVstack(topText: model?.mt ?? "MT", bottomText: model?.tt ?? "TT",color: textColor,font : AppFonts.smallText)
                            .frame(width: Dimensions.screenWidth * 0.07 - 3 )
                            
                            FlightProgressDoubleTextVstack(topText: model?.distance ?? "Dist.", bottomText: model?.accuracy ?? "Acc.",color: textColor,font : AppFonts.smallText)
                            .frame(width: Dimensions.screenWidth * 0.06 - 2)
                            
                            FlightProgressDoubleTextVstack(topText: model?.fl ?? "FL", bottomText: model?.ma ?? "MA",color: textColor,font : AppFonts.smallText)
                            .frame(width: Dimensions.screenWidth * 0.06 - 1)
                            
                            VerticalDivider(height: height, color: model == nil ? .white : .black)
                                .frame(width: 1)
                            
                        }
                        .frame(width: Dimensions.screenWidth * 0.26)
                        
                        HStack(spacing : 0){
                            CustomWidthSpacer(width: Dimensions.defaultPadding)
                            
                            FlightProgressDoubleTextVstack(topText: model?.waypoint ?? "Waypoint", bottomText: model?.identTypeFreq ?? "Ident Type Frq",color: textColor,font : AppFonts.smallText)
                                .frame(width: Dimensions.screenWidth * 0.17 - Dimensions.defaultPadding)
                            
                            
                            FlightProgressDoubleTextVstack(topText: model?.time ?? "Time", bottomText: model?.accuracy ?? "Acc.",color: textColor,font : AppFonts.smallText)
                            .frame(width: Dimensions.screenWidth * 0.07)
                            
                            FlightProgressDoubleTextVstack(topText: model?.eto ?? "ETO", bottomText: model?.reto ?? "RETO",color: textColor,font : AppFonts.smallText)
                            .frame(width: Dimensions.screenWidth * 0.07)
                            
                            
                            FlightProgressDoubleTextVstack(topText: "", bottomText: model?.ato ?? "ATO", color: textColor,font : AppFonts.smallText)
                            .frame(width: Dimensions.screenWidth * 0.07 - 1)
                            
                            
                            VerticalDivider(height: height, color: model == nil ? .white : .black)
                                .frame(width: 1)
                        }
                        .frame(width: Dimensions.screenWidth * 0.38)
                        
                        
                        HStack(spacing : 0){
                            
                            CustomWidthSpacer(width: Dimensions.defaultPadding)
                            
                            FlightProgressDoubleTextVstack(topText: model?.ato ?? "TAS", bottomText: model?.gs ?? "GS",color: textColor,font : AppFonts.smallText)
                                .frame(width: Dimensions.screenWidth * 0.05 - Dimensions.defaultPadding / 2)
                            
                            FlightProgressDoubleTextVstack(topText: model?.windVelocity ?? "W/V", bottomText: model?.windComponent ?? "WC",color: textColor,font : AppFonts.smallText)
                            .frame(width: Dimensions.screenWidth * 0.09 - 1)
                            
                            FlightProgressDoubleTextVstack(topText: model?.isa ?? "ISA", bottomText: model?.sat ?? "SAT",color: textColor,font : AppFonts.smallText)
                            .frame(width: Dimensions.screenWidth * 0.08 - Dimensions.defaultPadding / 2)
                            
                            VerticalDivider(height: height, color: model == nil ? .white : .black)
                                .frame(width: 1)
                        }
                        .frame(width: Dimensions.screenWidth * 0.22)
                        
                        
                        HStack(spacing : 0){
                            CustomWidthSpacer(width: Dimensions.defaultPadding / 2)
                            
                            FlightProgressDoubleTextVstack(topText: model?.remaining ?? "Rem.", bottomText: model?.actual ?? "Actu.",color: textColor,font : AppFonts.smallText)
                                .frame(width: Dimensions.screenWidth * 0.07 - Dimensions.defaultPadding / 2)
                            
                            FlightProgressDoubleTextVstack(topText: model?.min ?? "Min.", bottomText: model?.diff ?? "Diff.", color: textColor,font : AppFonts.smallText)
                            .frame(width: Dimensions.screenWidth * 0.07 - Dimensions.defaultPadding / 2)
                            
                            Rectangle()
                                .foregroundStyle(model == nil ? .mainBlue : isSelected ? .orangeBorder : Color(bgColor))
                                .frame(width : Dimensions.defaultPadding / 2, height : height)
                        }
                        .frame(width: Dimensions.screenWidth * 0.14)
                        
                    }
                }
                .border(isSelected ? Color.orangeBorder : Color.clear)
                
            }
            .frame(width: Dimensions.screenWidth , height: model == nil ? height * 0.8 : height)
        }
    }


#Preview {
    ModelViewFlightProgressScreen(
        bgColor: .white
        
    )
}

struct FlightProgressDoubleTextVstack: View {
    var isSpacer: Bool = true
    var isBold : Bool = false
    var topText: String
    var bottomText: String
    var color : Color?
    var font : Font?
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                
                CroppedText(text: topText, textColor: color, font: font ?? AppFonts.defaultText)
                
                CroppedText(text: bottomText, textColor: color, font: font ?? AppFonts.defaultText)
            }
            if(isSpacer){
                Spacer()
            }
        }
        
    }
}
