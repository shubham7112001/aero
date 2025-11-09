//
//  PrimaryScreenOfpScreens.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct PrimaryScreenOfpScreens: View {
    
    @Binding var selected  : PrimaryScreenOfpScreenSelection;
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.veryLightGrey)
                VStack(spacing : 0){
                    HeadingTextNavigationSplitView(text: AppTexts.flightPlan)
                    ScrollView{
                        sectionSpacing()
                        VStack(spacing:0){
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.checkRemarks
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.checkmark, iconBGColor: Color.red, text: AppTexts.checkRemarks,bgColor: selected == PrimaryScreenOfpScreenSelection.checkRemarks ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.checkRemarks ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.forms
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.docText, iconBGColor: Color.red, text: AppTexts.forms,bgColor: selected == PrimaryScreenOfpScreenSelection.forms ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.forms ? true : false,isDivider: false)
                            }
                        }
                        
                        
                        
                        itemSpacing()
                        
                        VStack(spacing:0){
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.mandatoryData
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.exclamationMark, iconBGColor: .orange, text: AppTexts.mandatoryData,isReverseSfIcons: true,bgColor: selected == PrimaryScreenOfpScreenSelection.mandatoryData ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.mandatoryData ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.documentsMessages
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.exclamationMarkBubble, iconBGColor: .main, text: AppTexts.documentsMessages,isReverseSfIcons: true,bgColor: selected == PrimaryScreenOfpScreenSelection.documentsMessages ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.documentsMessages ? true : false)
                            }
                            
                            Button{
                                isSheetPresented = true;
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: "airplane", iconBGColor: .mainBlue, text: AppTexts.notam,bgColor: selected == PrimaryScreenOfpScreenSelection.notam ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.notam ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.weather
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.cloudSun, iconBGColor: .mainBlue, text: AppTexts.weather,isReverseSfIcons: true,bgColor: selected == PrimaryScreenOfpScreenSelection.weather ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.weather ? true : false,isDivider: false)
                            }
                        }
                        
                        itemSpacing()
                        
                        VStack(spacing:0){
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.flightCrew
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: "airplane", iconBGColor: .orange, text: AppTexts.flightCrew,bgColor: selected == PrimaryScreenOfpScreenSelection.flightCrew ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.flightCrew ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.times
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.clock, iconBGColor: .main, text: AppTexts.times,bgColor: selected == PrimaryScreenOfpScreenSelection.times ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.times ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.waypoints
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.dotted, iconBGColor: .main, text: AppTexts.waypoints,bgColor: selected == PrimaryScreenOfpScreenSelection.waypoints ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.waypoints ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.alternates
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.dotted, iconBGColor: .main, text: AppTexts.alternates,bgColor: selected == PrimaryScreenOfpScreenSelection.alternates ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.alternates ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.routeProfile
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.mappin, iconBGColor: .main, text: AppTexts.routeProfile,bgColor: selected == PrimaryScreenOfpScreenSelection.routeProfile ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.routeProfile ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.rvsm
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.arrowUpLine, iconBGColor: .green, text: AppTexts.rvsm,bgColor: selected == PrimaryScreenOfpScreenSelection.rvsm ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.rvsm ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.takeOff
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.arrowUpForward, iconBGColor: .green, text: AppTexts.takeOff,bgColor: selected == PrimaryScreenOfpScreenSelection.takeOff ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.takeOff ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.landing
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.arrowDownForward, iconBGColor: .green, text: AppTexts.landing,bgColor: selected == PrimaryScreenOfpScreenSelection.landing ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.landing ? true : false)
                            }
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.fuel
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.fuelPumpFill, iconBGColor: .gray, text: AppTexts.fuel,bgColor: selected == PrimaryScreenOfpScreenSelection.fuel ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.fuel ? true : false,isDivider: false)
                            }
                        }
                        
                        itemSpacing()
                        VStack(spacing:0){
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.performanceReports
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.gaugeWithDotsNeedle, iconBGColor: .red, text: AppTexts.performanceReports,bgColor: selected == PrimaryScreenOfpScreenSelection.performanceReports ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.performanceReports ? true : false)
                            }
                            //                            .toAnyView(),
                            
                            Button{
                                selected = PrimaryScreenOfpScreenSelection.loadSummary
                            }label: {
                                PrimaryViewModelNavigationSplitView(imgSF: SFIcons.arrowUpTrash, iconBGColor: .red, text: AppTexts.loadSummary,bgColor: selected == PrimaryScreenOfpScreenSelection.loadSummary ? .mainBlue : .white, isTextWhite: selected == PrimaryScreenOfpScreenSelection.loadSummary ? true : false,isDivider: false)
                            }
                        }
                        Spacer()
                    }
                }
                
            }
            .fullScreenCover(isPresented: $isSheetPresented) {
                NotamDetailScreenOfpScreen()
            }
        }
        .frame(width: Dimensions.navigationSplitViewPrimaryWidth)
    }
}

#Preview {
    PrimaryScreenOfpScreens(selected: .constant(PrimaryScreenOfpScreenSelection.checkRemarks))
}
