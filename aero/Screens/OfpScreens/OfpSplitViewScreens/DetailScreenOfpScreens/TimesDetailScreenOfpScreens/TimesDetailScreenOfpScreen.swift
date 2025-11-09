//
//  TimesDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct TimesDetailScreenOfpScreen: View {
    @StateObject var timesViewModel: TimesOfpViewModel = TimesOfpViewModel()
    var body: some View {
        NavigationStack{
            DetailNavigationSplitView{
                
                TextTextHStack(leftText: "Update CTOT", rightText: "Updated: 25 DEC 2024 10:26 Z", rightOpacity: true, leftTextColor: .mainBlue)
                
                HStack{
                    Text("Internet access must be available to update CTOT.")
                        .multilineTextAlignment(.leading)
                        .font(AppFonts.verySmallText)
                        .opacity(AppConstants.defaultOpacity)
                        .padding(CustomPadding.padding)
                    
                    Spacer()
                }
                
                itemSpacing()
                        
                DividerWithActionsVstack(actions: [
                    TextTextHStack(leftText: AppTexts.scheduledTimeOfDeparture, rightText: "11 JUL 2024 20:30 Z",leftOpacity: true,rightOpacity: true).toAnyView(),
                    
                    CustomDateTimePicker(text: AppTexts.calculatedTakeOffTime)
                        .toAnyView(),
                    
                    TextTextHStack(leftText: AppTexts.scheduledTimeOfArrival, rightText: "11 JUL 2024 20:30 Z",leftOpacity: true,rightOpacity: true).toAnyView()
                ])
                
                itemSpacing()
                
                NavigationLink{
                    DelayCodesTimeOfpScreen(timesViewModel: timesViewModel)
                }label:{
                    IconTextDetailSplitNavigationView(text: AppTexts.delayCodes)
                }
                .accentColor(AppColors.navAccentColor)
                
                itemSpacing()
                
                CapitalizedTextHalfOpacity(text: "BLOCK TIMES")
                
                
                DividerWithActionsVstack(actions: [
                    CustomDateTimePicker(text: AppTexts.offBlock)
                        .toAnyView(),
                    
                    CustomDateTimePicker(text: AppTexts.onBlock)
                        .toAnyView(),
                    
                    TextTextHStack(leftText: AppTexts.blockTime, rightText: "00:00",leftOpacity: true,rightOpacity: true).toAnyView()
                ])
                
                itemSpacing()
                
                CapitalizedTextHalfOpacity(text: AppTexts.flightTimesCap)
                
                DividerWithActionsVstack(actions: [
                    CustomDateTimePicker(text: AppTexts.airborne)
                        .toAnyView(),
                    
                    CustomDateTimePicker(text: AppTexts.landed)
                        .toAnyView(),
                    
                    TextTextHStack(leftText: AppTexts.flightTime, rightText: "00:00",leftOpacity: true,rightOpacity: true).toAnyView()
                ])
                
                itemSpacing()
                
                DividerWithActionsVstack(actions: [
                    TextWithFieldHStack(text: "TTSN pre-flight", input: $timesViewModel.ttsnPreFlight, suffixText: "hrs")
                        .toAnyView(),
                    
                    TextWithFieldHStack(text: "TTSN post-flight", input: $timesViewModel.ttsnPostFlight, suffixText: "hrs")
                        .toAnyView()
                ])
                
                itemSpacing()
                
                CapitalizedTextHalfOpacity(text: "CYCLES")
                
                DividerWithActionsVstack(actions: [
                    TextWithFieldHStack(text: "Landings", input: $timesViewModel.landings, suffixText: "hrs")
                        .toAnyView(),
                    TextWithFieldHStack(text: "Aircraft cycles pre-flight", input: $timesViewModel.preFlightCycles)
                        .toAnyView(),
                    TextTextHStack(leftText: "Total aircraft cycles", rightText: "1", leftOpacity: true, rightOpacity: true)
                        .toAnyView(),
                    TextWithFieldHStack(text: "Engine", input: $timesViewModel.engine, suffixText: "hrs")
                        .toAnyView(),
                    
                ])
                
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    TimesDetailScreenOfpScreen()
}
