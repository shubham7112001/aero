//
//  AircraftFlightCrewOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/12/24.
//

import SwiftUI

struct AircraftFlightCrewOfpScreen: View {
    @ObservedObject var flightCrewViewModel: FlightCrewOfpViewModel
    var body: some View {
        DetailNavigationSplitView(heading: "Aircraft",leadingActions: [
            LightWhiteText(text: "Flight info.").toAnyView()
        ]){
            DividerWithActionsVstack(actions: [
                TextTextHStack(leftText: "Registration", rightText: "OYMGO", leftOpacity: true, rightOpacity: true).toAnyView(),
                
                TextTextHStack(leftText: "Type", rightText: "F2TH", leftOpacity: true, rightOpacity: true).toAnyView(),
                
                TextTextHStack(leftText: "Serial no.", rightText: "", leftOpacity: true, rightOpacity: true).toAnyView()
                
            ])
        }
    }
}

#Preview {
    AircraftFlightCrewOfpScreen(flightCrewViewModel: FlightCrewOfpViewModel())
}
