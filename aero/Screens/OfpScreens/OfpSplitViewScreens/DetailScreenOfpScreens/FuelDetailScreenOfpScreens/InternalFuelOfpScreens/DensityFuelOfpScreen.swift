//
//  DensityFuelOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/12/24.
//

import SwiftUI

struct DensityFuelOfpScreen: View {
    @ObservedObject var fuelViewModel: FuelOfpViewModel
    var body: some View {
        DetailNavigationSplitView(leftText: "Fuel", heading: "Density"){
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: "Default", input: $fuelViewModel.densityFuels[0], suffixText: "kg/L").toAnyView(),
                
                TextWithFieldHStack(text: "Refuelling departure", input: $fuelViewModel.densityFuels[1], suffixText: "kg/L").toAnyView(),
                
                TextWithFieldHStack(text: "Refuelling destination", input: $fuelViewModel.densityFuels[2], suffixText: "kg/L").toAnyView()
            ])
        }
    }
}

#Preview {
    DensityFuelOfpScreen(fuelViewModel: FuelOfpViewModel())
}
