//
//  RefuellingFuelOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/12/24.
//

import SwiftUI

struct RefuellingFuelOfpScreen: View {
    @State private var selection: Int = 0
    @ObservedObject var fuelOfpViewModel: FuelOfpViewModel
    var body: some View {
        DetailNavigationSplitView(leftText: "Fuel", heading: "Refuelling"){
            
            Picker("", selection: $selection
            ){
                Text("Departure").tag(0);
                Text("Destination").tag(1)
            }
            .pickerStyle(.segmented)
            .frame(width: Dimensions.navigationSplitViewPrimaryWidth * 0.7)
            
            selection == 0
            ? RefuellingFuelModelOfpScreen(viewModel: fuelOfpViewModel.refuellingDeparture)
            : RefuellingFuelModelOfpScreen(viewModel: fuelOfpViewModel.refuellingDestination)
            
        }
    }
}

#Preview {
    RefuellingFuelOfpScreen(fuelOfpViewModel: FuelOfpViewModel())
}
