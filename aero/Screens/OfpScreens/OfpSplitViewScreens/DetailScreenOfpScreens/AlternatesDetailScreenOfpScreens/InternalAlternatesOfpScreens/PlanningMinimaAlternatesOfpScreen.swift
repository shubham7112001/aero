//
//  PlanningMinimaAlternatesOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct PlanningMinimaAlternatesOfpScreen: View {
    @ObservedObject var alternatesViewModel: AlternatesOfpViewModel
    var body: some View {
        DetailNavigationSplitView(heading: "Planning minima", leadingActions: [
            Text("Alternate 1")
                .foregroundStyle(.dWhite)
                .toAnyView()
        ]){
            CapitalizedTextHalfOpacity(text: "METAR / TF")
            
            VStack(alignment: .leading, spacing: 0){
                
                Text(alternatesViewModel.metarText)
                    .padding(CustomPadding.padding)
                
                Divider()
                    .padding(CustomPadding.lPadding)
                
                Text(alternatesViewModel.tafText)
                    .padding(CustomPadding.padding)
            }
            .opacity(AppConstants.defaultOpacity)
            .background(.dWhite)
            
            itemSpacing()
            
            CapitalizedTextHalfOpacity(text: "Conditions")
            
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: "RVR", input: $alternatesViewModel.planingRvr, suffixText: "m").toAnyView(),
                
                TextWithFieldHStack(text: "Ceiling", input: $alternatesViewModel.planingCeiling, suffixText: "ft").toAnyView()
            ])
            
            itemSpacing()
            
            CapitalizedTextHalfOpacity(text: "RUNWAY FACILITIES")
            
            SingleItemSelectionView(itemsList: alternatesViewModel.runwayList)
            
            itemSpacing()
            
            SingleItemSelectionView(itemsList: alternatesViewModel.catIlsList)
        }
    }
}

#Preview {
    PlanningMinimaAlternatesOfpScreen(alternatesViewModel: AlternatesOfpViewModel())
}
