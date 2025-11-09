//
//  PlannedFuelListScreens.swift
//  taillog
//
//  Created by Shubham Tiwari on 02/01/25.
//

import SwiftUI

struct PlannedFuelListScreens: View {
    @ObservedObject var fuelViewModel: FuelOfpViewModel
    var body: some View {
        VStack(spacing: 0){
            VStack(spacing: 0){
                ForEach(Array(fuelViewModel.plannedFuelList.enumerated()), id: \.element.id ){index, plannedModel in
                    NavigationLink{
                        PlannedFuelRowModelScreen(viewModel: fuelViewModel, index: index)
                    }label:{
                        VStack(spacing: 0){
                            TextTextIconHStack(leftText: plannedModel.heading, rightText: plannedModel.resultant, leftOpacity: index % 2 == 0 ? AppConstants.defaultOpacity : 1 ,isIcon: !(index % 2 == 0))
                            
                            Divider().padding(CustomPadding.lPadding)
                        }
                    }
                    .accentColor(AppColors.navAccentColor)
                    .disabled(index % 2 == 0)
                }
            }
            
            DividerWithActionsVstack(actions: [
                TextTextHStack(leftText: "Minimum required at destination", rightText: "1373 lb", leftOpacity: true, rightOpacity: true).toAnyView(),
                
                TextTextHStack(leftText: "Landing planned", rightText: "1492 lb", leftOpacity: true, rightOpacity: true).toAnyView()
            ])
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
        .background(.dWhite)
    }
}
#Preview {
    PlannedFuelListScreens(fuelViewModel: FuelOfpViewModel())
}
