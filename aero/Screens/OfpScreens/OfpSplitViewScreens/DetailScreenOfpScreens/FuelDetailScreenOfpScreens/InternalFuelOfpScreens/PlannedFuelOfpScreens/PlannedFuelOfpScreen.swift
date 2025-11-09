//
//  PlannedFuelOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 02/01/25.
//

import SwiftUI

struct PlannedFuelOfpScreen: View {
    @ObservedObject var fuelViewModel: FuelOfpViewModel
    var body: some View {
        NavigationStack{
            DetailNavigationSplitView(leftText: "Fuel", heading: "Planned fuel"){
                PlannedFuelListScreens(fuelViewModel: fuelViewModel)
                    
                
                itemSpacing()
                
                CapitalizedTextHalfOpacity(text: "fuel corrections")
                
                TextTextHStack(leftText: "Gain/loss cost per extra ton fuel", rightText: "LOSS 152$/TON", leftOpacity: true, rightOpacity: true)
                
                itemSpacing()
                
                PlannedFuelDataModelScreen(fuelViewModel: fuelViewModel)
                
            }
        }
        .padding(CustomPadding.hPadding)
    }
}

#Preview {
    PlannedFuelOfpScreen(fuelViewModel: FuelOfpViewModel())
}
