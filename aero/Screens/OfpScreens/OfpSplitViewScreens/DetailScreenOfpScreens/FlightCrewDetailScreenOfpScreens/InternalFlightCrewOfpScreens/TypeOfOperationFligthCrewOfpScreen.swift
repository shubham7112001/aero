//
//  TypeOfOperationFligthCrewOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/12/24.
//

import SwiftUI

struct TypeOfOperationFligthCrewOfpScreen: View {
    @ObservedObject var flightCrewViewModel: FlightCrewOfpViewModel
    var body: some View {
        DetailNavigationSplitView(heading: "Type of operation",leadingActions: [
            LightWhiteText(text: "Flight info.").toAnyView()
        ]){
            
            SingleItemSelectionView(itemsList: flightCrewViewModel.scheduleList)
            
            Divider().padding(CustomPadding.lPadding)
            
            SingleItemSelectionView(itemsList: flightCrewViewModel.commercialList)
            
            itemSpacing()
            
            SingleItemSelectionView(itemsList: flightCrewViewModel.ifrVfrList)
            
            itemSpacing()
            
            SingleItemSelectionView(itemsList: flightCrewViewModel.operationList)
        }
    }
}

#Preview {
    TypeOfOperationFligthCrewOfpScreen(flightCrewViewModel: FlightCrewOfpViewModel())
}
