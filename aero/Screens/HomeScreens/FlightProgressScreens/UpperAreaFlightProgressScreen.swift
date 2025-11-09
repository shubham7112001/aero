//
//  ActualPlannedFlightProgressScreen.swift
//  taillog
//
//  Created by Sword Software on 28/06/24.
//

import SwiftUI

enum UpperFlightProgressType{
    case runEnable
    case runDisable
    case offBlk
    case ato
    case land
    case onBlk
    case end
    case load
}

struct UpperAreaFlightProgressScreen: View {
    
    var imageSize : CGFloat = Dimensions.screenHeight  * 0.08
    
    @State private var showRampFuelAlert : Bool = false
    @State private var showConfirmAtoAlert : Bool = false
    
    @State private var moveToOfpScreen : Bool = false
    @State private var moveToAvlFlightPlanScreen : Bool = false
    
    @State private var showFlightConclusionSheet : Bool = false
    
    @State private var upperPartView : UpperFlightProgressType = UpperFlightProgressType.runEnable
    
    var body: some View {
        
        ZStack{
            Color(.bg)
            HStack{
                
                // LEFT PART (Text Part)
                textPortionView()
                
                Spacer()
                
                // RIGHT PART (Image Part)
                imageView()
                itemSpacingWidth()
            }
            
        }
        .frame(height: Dimensions.screenHeight * 0.18)
        .formSheet(isPresented: $showFlightConclusionSheet, content: {
            MainFlightConclusionFlightProgressScreen(showSheet: $showFlightConclusionSheet)
        })
        .navigationDestination(isPresented: $moveToOfpScreen){
            OfpScreen()
        }.navigationDestination(isPresented: $moveToAvlFlightPlanScreen){
            AvailableFlightPlanScreen(homeScreenViewModel: HomeScreenViewModel())
        }

    }
    
    private func textPortionView() -> some View{
        return VStack(spacing : 0){
            HStack(alignment: .top){
                itemSpacingWidth()
                
                VStack(alignment:.leading){
                    LightWhiteText(text:  "Current action", font: AppFonts.smallText)
                    HStack{
                        itemSpacingWidth()
                        LightWhiteText(text:AppTexts.flightProgressInactive, font: AppFonts.smallText)
                    }
                    Spacer()
                }
                
                
                Spacer()
                
                internalUpperAreaTopPart()
    
                itemSpacingWidth()
            }
            .frame(height: Dimensions.screenHeight * 0.1)
            
            HorizontalDivider(height: 1)
            
            internalUpperAreaBottomPart()
            .frame(height: Dimensions.screenHeight * 0.06)
            
            
        }
    }
    
    private func imageView() -> some View{
        return VStack{
            if(upperPartView == .runDisable){
                loadImageView()
            }
            else{
                ofpImageView()
            }
            
            switch(upperPartView){
                case .runEnable :
                    runEnableImageView()
                case .runDisable :
                    runDisableImageView()
                case .ato :
                    atoImageView()
                case .land : 
                    landImageView()
                case .onBlk: 
                    onBlkImageView()
                case .offBlk :
                    offBlkImageView()
                case .end:
                    endImageView()
                case .load:
                    loadImageView()
            }
        }
    }
    
    private func loadFlightPlanUpperArea() -> some View{
        return VStack(alignment : .leading){
            
            LightWhiteText(text: "FLight plan loaded")
            
            LightWhiteText(text: "Press RUN to activate")
            
            Spacer()
        }
        .padding(CustomPadding.padding)
    }
    
    private func internalUpperAreaTopPart() -> some View {
        VStack(alignment: .leading) {
            sectionHeaderWithContent(
                header: "Planned:",
                items: ["MT", "FL", "GS", "TAS", "Time", "RETO"],
                values: Array(repeating: "-", count: 6)
            )
            
            sectionHeaderWithContent(
                header: "Actual:",
                items: ["MT", "/ Inbound", "GS", "Remaining", "time/distance"],
                values: ["189", "-", "7", "-", "-"]
            )
        }
    }

    private func internalUpperAreaBottomPart() -> some View {
        HStack {
            itemSpacingWidth()
            TextWithDescriptionFlightProgressScreen(
                topText: "Next",
                bottomText: "MT On-block GCLP - Parking",
                font: AppFonts.smallText
            )
            Spacer()
            sectionSpacingWidth()
            sectionItemsWithValues(
                items: ["MT", "FL", "GS", "TAS", "Time", "RETO"],
                values: Array(repeating: "-", count: 6)
            )
            Spacer()
        }
    }

    private func sectionHeaderWithContent(header: String, items: [String], values: [String]) -> some View {
        HStack(alignment: .top) {
            LightWhiteText(text: header, font: AppFonts.smallText)
            sectionItemsWithValues(items: items, values: values)
        }
    }

    private func sectionItemsWithValues(items: [String], values: [String]) -> some View {
        ForEach(Array(zip(items, values)), id: \.0) { item, value in
            DoubleTextVstack(isSpacer: false, topText: item, bottomText: value, font: AppFonts.smallText)
        }
    }
    
    private func roundedWithCircleContainer(text: String, isCircle : Bool = false, bgColor : Color = Color.blue, function: @escaping () -> Void = {}) -> some View{
        return ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(bgColor)
                .frame(width: imageSize, height: imageSize)
            if (isCircle){
                Circle()
                    .stroke(.dWhite, lineWidth: 1)
                    .frame(width: imageSize * 0.8, height: imageSize * 0.8)
                
            }
            Text(text.uppercased())
                .font(AppFonts.largeText)
                .foregroundColor(.white)
        }
        .wrapInButton {
            function()
        }
    }
    
    // IMAGE BUTTONS FOR IMAGE VIEW
    
    private func ofpImageView() -> some View{
        return roundedWithCircleContainer(text: "ofp", bgColor: .orange, function: {
            moveToOfpScreen = true
        })
    }
    
    private func runEnableImageView() -> some View{
        return roundedWithCircleContainer(text: "run", isCircle : true,bgColor: .mainBlue, function: {
            showRampFuelAlert = true
        })
        .alert("Confirm ramp fuel", isPresented: $showRampFuelAlert){
            Button("Confirm") { 
                showRampFuelAlert = false;
                upperPartView = .offBlk
            }
            Button("Change"){
            }
        } message:{
                Text("The actual ramp fuel appears not validated. Please confirm.\n\nActual ramp fuel = 2996lb")
        }
    }
    
    private func runDisableImageView() -> some View{
        return roundedWithCircleContainer(text: "run", isCircle : true,bgColor: .gray)
    }
    
    
    private func loadImageView() -> some View{
        return roundedWithCircleContainer(text: "load", bgColor: .orange, function: {
            moveToAvlFlightPlanScreen = true
        })
    }
    
    private func atoImageView() -> some View{
        return roundedWithCircleContainer(text: "ato", bgColor: .mainBlue, function: {

            CustomAlertManager.shared.showAlert(view: CustomAlertDateSelection(
                headingStaticText: "Confirm ATO",
                centerTopText: "Confirm actual time over waypoint:",
                centerBottomText: "ARACO - ARACO A",
                boldText: "ATO",
                rightBtnText: "ATO",
                leftBtnAction: {},
                rightBtnAction: {
                    upperPartView = .land
                }
            ))
        })
    }
    
    private func landImageView() -> some View{
        return roundedWithCircleContainer(text: "land", bgColor: .mainBlue, function: {

            CustomAlertManager.shared.showAlert(view: CustomAlertDateSelection(
                headingStaticText: "Confirm landed",
                centerTopText: "Confirm landed and flight on-ground.",
                boldText: "LAND",
                rightBtnText: "Landed",
                leftBtnAction: {},
                rightBtnAction: {
                    upperPartView = .onBlk
                }
            ))
        })
    }
    
    private func onBlkImageView() -> some View{
        return roundedWithCircleContainer(text: "ON\nBLK", bgColor: .mainBlue, function: {

            CustomAlertManager.shared.showAlert(view: CustomAlertDateSelection(
                headingStaticText: "Confirm on-block",
                centerTopText: "Confirm on-block and flight complete.",
                boldText: "ON",
                rightBtnText: "On-block",
                leftBtnAction: {},
                rightBtnAction: {
                    upperPartView = .end
                }
            ))
        })
    }
    
    private func offBlkImageView() -> some View{
        return roundedWithCircleContainer(text: "OFF\nBLK", bgColor: .mainBlue, function: {

            CustomAlertManager.shared.showAlert(view: CustomAlertDateSelection(
                headingStaticText: "Confirm off-block",
                centerTopText: "Confirm off-block and flight start.",
                boldText: "OFF",
                rightBtnText: "Off-block",
                leftBtnAction: {},
                rightBtnAction: {
                    upperPartView = .ato
                }
            ))
        })
    }
    
    private func endImageView() -> some View{
        return roundedWithCircleContainer(text: "END", isCircle: true, bgColor: .mainBlue, function: {
            showFlightConclusionSheet = true
            upperPartView = .runDisable
        })
    }
    
}

#Preview {
    UpperAreaFlightProgressScreen()
}

struct TextWithDescriptionFlightProgressScreen: View {
    var topText : String
    var bottomText : String
    var font: Font = AppFonts.defaultText
    
    var body: some View {
        VStack(alignment:.leading){
            LightWhiteText(text: topText,font : font)
            HStack{
                itemSpacingWidth()
                LightWhiteText(text:bottomText, font: font)
            }
            
        }
    }
}

