//
//  DepDestAltFlightCrewOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/12/24.
//

import SwiftUI

struct DepDestAltFlightCrewOfpScreen: View {
    let heading: String
    @ObservedObject var flightCrewViewModel : FlightCrewOfpViewModel
    
    var body: some View {
        
        DetailNavigationSplitView(heading: heading, leadingActions: [
            LightWhiteText(text: "Flight info.").toAnyView()
        ]){
            
            DividerWithActionsVstack(actions: [
                TextTextHStack(leftText: "ICAO", rightText: "ENBR", leftOpacity: true, rightOpacity: true).toAnyView(),
                TextTextHStack(leftText: "IATA", rightText: "BGO", leftOpacity: true, rightOpacity: true).toAnyView(),
                TextTextHStack(leftText: "Name", rightText: "BERGEN/FLESLAND", leftOpacity: true, rightOpacity: true).toAnyView()
            ])
            
            itemSpacing()
            
            DividerWithActionsVstack(actions: [
                TextTextHStack(leftText: "ELEV", rightText: "ENBR", leftOpacity: true, rightOpacity: true).toAnyView(),
                TextTextHStack(leftText: "LAT/LON", rightText: "N 60:17.5 / E 005:13.1", leftOpacity: true, rightOpacity: true).toAnyView()
            ])
            
            itemSpacing()
            
            DividerWithActionsVstack(actions:  flightCrewViewModel.departure.runways.keys.sorted().map { key in
                    let value = flightCrewViewModel.departure.runways[key] ?? ""
                    return TextTextHStack(leftText: key, rightText: value, leftOpacity: true, rightOpacity: true)
                        .toAnyView()
                }
            
            )
        }
    }
}

#Preview {
    DepDestAltFlightCrewOfpScreen(heading: "Destination", flightCrewViewModel: FlightCrewOfpViewModel())
}
