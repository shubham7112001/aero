//
//  CrewInfoFlightCrewOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/12/24.
//

import SwiftUI

struct CrewInfoFlightCrewOfpScreen: View {
    let heading: String
    @ObservedObject var flightCrewViewModel: FlightCrewOfpViewModel
    @State var timePicker: Date = Date()
    
    var body: some View {
        DetailNavigationSplitView(heading: heading,leadingActions: [
            LightWhiteText(text: "Flight & crew").toAnyView()
        ]){
            DividerWithActionsVstack(actions:[
                TextTextHStack(leftText: "Pilot in command", rightText: "TIA", rightOpacity: true).toAnyView()
            ])
            
            itemSpacing()
            
            SingleItemSelectionView(itemsList: flightCrewViewModel.pilotFlyingList)
            
            itemSpacing()
            
            CustomPopoverPicker(list: flightCrewViewModel.approachTypeList, leftText : "Approach Type", isIcon: true)
            
            itemSpacing()
            
            DividerWithActionsVstack(actions: [
                CustomDateTimePicker(text: "Duty on", isWheel: true).toAnyView(),
                CustomDateTimePicker(text: "Duty off", isWheel: true).toAnyView(),
                CustomTimePicker(time: $timePicker, text: "Rest").toAnyView(),
                CustomDateTimePicker(text: "Split duty start", isWheel: true).toAnyView(),
                CustomDateTimePicker(text: "Split duty end", isWheel: true).toAnyView(),
                TextWIthToggleSwitch(text: "Use FDP extension", isOn: $flightCrewViewModel.pilot.isFdpExtension).toAnyView()
            ])
            
                                     
        }
    }
}

#Preview {
    CrewInfoFlightCrewOfpScreen(heading: "Heading", flightCrewViewModel: FlightCrewOfpViewModel())
}
