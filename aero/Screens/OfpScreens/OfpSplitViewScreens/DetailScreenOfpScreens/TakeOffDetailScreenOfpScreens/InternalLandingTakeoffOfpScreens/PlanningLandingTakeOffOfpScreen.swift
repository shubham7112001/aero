//
//  PlanningTakeOffOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct PlanningLandingTakeOffOfpScreen: View {
    @ObservedObject var viewModel: LandingTakeOffViewModel
    let backBarText: String
    var body: some View {
        DetailNavigationSplitView(leftText: backBarText, heading: "Planning minima"){
            CapitalizedTextHalfOpacity(text: "METAR / TF")
            
            DynamicDoubleTextVstack(upperText: viewModel.metarText, lowerText: viewModel.tafText)
            
            itemSpacing()
            
            CapitalizedTextHalfOpacity(text: "Conditions")
            
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: "RVR", input: $viewModel.planingRvr, suffixText: "m").toAnyView(),
                
                TextWithFieldHStack(text: "Ceiling", input: $viewModel.planingCeiling, suffixText: "ft").toAnyView()
            ])
            
            itemSpacing()
            
            CapitalizedTextHalfOpacity(text: "RUNWAY FACILITIES")
            
            SingleItemSelectionView(itemsList: viewModel.runwayList)
            
            itemSpacing()
            
            SingleItemSelectionView(itemsList: viewModel.catIlsList)
        }
    }
}

#Preview {
    PlanningLandingTakeOffOfpScreen(viewModel: LandingTakeOffViewModel(), backBarText: "BackBartext")
}
