//
//  ModelInternalWaypointsOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/09/24.
//

import SwiftUI

struct ModelInternalWaypointsOfpScreen: View {
    @ObservedObject var waypointsViewModel : WaypointsOfpViewModel
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
            VStack(spacing : 0){
                HeadingInternalScreenOfpScreen(leftText: AppTexts.waypoints, centerText: "Departure airport : ABCD")
                
                VStack(spacing : 0){
                    ScrollView{
                        sectionSpacing()
                        
                        CapitalizedTextHalfOpacity(text : "remarks")
                        
                        VStack{
                            CustomTextEditor(inputText: $waypointsViewModel.remarks)
                        }
                        .background(.dWhite)
                        
                        itemSpacing()
                        
                        TextTextHStack(leftText: "Sequence ID", rightText: waypointsViewModel.sequenceId, leftOpacity: true, rightOpacity: true)
                        
                        itemSpacing()
                        
                        DividerWithActionsVstack(actions: [
                            
                            TextTextHStack(leftText: "Airway FIR", rightText: waypointsViewModel.airwayFir, leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "Position", rightText: waypointsViewModel.position, leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "Ident./Type/Freq.", rightText: waypointsViewModel.identTypeFreq, leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "LAT/LON", rightText: waypointsViewModel.latLon, leftOpacity: true, rightOpacity: true).toAnyView()
                            
                        ])
                        
                        itemSpacing()
                        
                        DividerWithActionsVstack(actions: [
                            
                            TextTextHStack(leftText: "MT / TT", rightText: "\(waypointsViewModel.mt)° / \(waypointsViewModel.tt)°",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "FL", rightText: "FL \(waypointsViewModel.fl)",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "MORA", rightText: "\(waypointsViewModel.mora) ft",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "Distance / Acc.", rightText: "\(waypointsViewModel.distanceAcc) NM",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "Time / Acc.", rightText: "\(waypointsViewModel.timeAcc)",leftOpacity: true, rightOpacity: true).toAnyView()
                            
                        ])
                        
                        itemSpacing()
                        
                        DividerWithActionsVstack(actions: [
                            
                            TextTextHStack(leftText: "ETO / RETO", rightText: "\(waypointsViewModel.eto) / \(waypointsViewModel.reto) Z",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "ATO", rightText: "\(waypointsViewModel.ato) Z",leftOpacity: true, rightOpacity: true).toAnyView()
                            
                        ])
                        
                        itemSpacing()
                        
                        DividerWithActionsVstack(actions: [
                            
                            TextTextHStack(leftText: "TAS / GS", rightText: "\(waypointsViewModel.tas) / \(waypointsViewModel.gs) kt",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "W/V", rightText: "\(waypointsViewModel.weight)° / \(waypointsViewModel.volume) kt",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "WC / CAT", rightText: "\(waypointsViewModel.wc) / \(waypointsViewModel.cat)",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "ISA / SAT", rightText: "\(waypointsViewModel.isa) / \(waypointsViewModel.sat)° C",leftOpacity: true, rightOpacity: true).toAnyView()
                            
                            
                        ])
                        
                        itemSpacing()
                        
                        DividerWithActionsVstack(actions: [
                            
                            TextTextHStack(leftText: "Fuel flow", rightText: "\(waypointsViewModel.fuelFlow) lb/h",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "Fuel used / Acc.", rightText: "\(waypointsViewModel.fuelUsedAcc) kt",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "Fuel remaining planned / Actual", rightText: "\(waypointsViewModel.fuelRemaining)",leftOpacity: true, rightOpacity: true).toAnyView(),
                            TextTextHStack(leftText: "Fuel minimum required / diff.", rightText: "\(waypointsViewModel.fuelMinimumRequired) lb",leftOpacity: true, rightOpacity: true).toAnyView()
                            
                            
                        ])
                        
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    ModelInternalWaypointsOfpScreen(waypointsViewModel: WaypointsOfpViewModel())
}
