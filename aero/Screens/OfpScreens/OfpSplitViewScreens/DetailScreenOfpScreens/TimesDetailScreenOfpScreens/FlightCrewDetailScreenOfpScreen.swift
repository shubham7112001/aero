//
//  FlightCrewDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct FlightCrewDetailScreenOfpScreen: View {
    @StateObject var flightCrewViewModel: FlightCrewOfpViewModel = FlightCrewOfpViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.veryLightGrey)
                VStack{
                    HeadingTextNavigationSplitView(text: AppTexts.flightCrew)
                    
                    ScrollView{
                        sectionSpacing()
                        
                        CapitalizedTextHalfOpacity(text: AppTexts.flightInformationCap)
                        
                        DividerWithActionsVstack(actions: [
                            TextTextHStack(leftText: AppTexts.flightIdLogNo, rightText: "MMD5237 / 6133 / FMS S4165",leftOpacity: true,rightOpacity: true).toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.dofStd, rightText: "11 JUL 2024 20:30 Z",leftOpacity: true,rightOpacity: true).toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.ofpPreparedBy, rightText: "rob / 08 JUL 2024 12:08 Z",leftOpacity: true,rightOpacity: true).toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.gufiCap, rightText: "80cff98e-202f-409a-8708-61164f678177",leftOpacity: true,rightOpacity: true).toAnyView()
                        ])
                        
                        itemSpacing()
                        
                        DividerWithActionsVstack(actions: [
                            NavigationLink{
                                AircraftFlightCrewOfpScreen(flightCrewViewModel: flightCrewViewModel)
                            }label:{
                                TextTextIconHStack(leftText: AppTexts.aircraft, rightText: "OYRAD / FA8X")
                            }
                                .accentColor(Color.black.opacity(AppConstants.defaultOpacity))
                                .toAnyView(),
                            
                            NavigationLink{
                                TypeOfOperationFligthCrewOfpScreen(flightCrewViewModel: flightCrewViewModel)
                            }label:{
                            TextTextIconHStack(leftText: AppTexts.typeOfOperation, rightText: "NS / IFR",leftOpacity: 0.5)
                            }
                                .accentColor(Color.black.opacity(AppConstants.defaultOpacity))
                                .toAnyView()
                        ])
                        
                        itemSpacing()
                        
                        DividerWithActionsVstack(actions: [
                            NavigationLink{
                                DepDestAltFlightCrewOfpScreen(heading: "Departure", flightCrewViewModel: flightCrewViewModel)
                            }label:{
                            TextTextIconHStack(leftText: AppTexts.departure, rightText: "ESSA / ARN / STOCKHOLM/ARLAN")
                            }
                                .accentColor(Color.black.opacity(AppConstants.defaultOpacity))
                                .toAnyView(),
                            
                            NavigationLink{
                                DepDestAltFlightCrewOfpScreen(heading: "Destination",flightCrewViewModel: flightCrewViewModel)
                            }label:{
                            TextTextIconHStack(leftText: AppTexts.destination, rightText: "VABB / BOM / MUMBAI/CHHATRAP")
                            }
                                .accentColor(Color.black.opacity(AppConstants.defaultOpacity))
                                .toAnyView(),
                            
                                
                            NavigationLink{
                                DepDestAltFlightCrewOfpScreen(heading: "Alternate 1",flightCrewViewModel: flightCrewViewModel)
                            }label:{
                            TextTextIconHStack(leftText: AppTexts.alternate1, rightText: "VASU / STV / SURAT")
                            }
                                .accentColor(Color.black.opacity(AppConstants.defaultOpacity))
                                .toAnyView()
                        ])
                        
                        sectionSpacing()
                        
                        CapitalizedTextHalfOpacity(text:AppTexts.crewInformationCap)
                        
                        CustomHeightSpacer(height: Dimensions.defaultPadding)
                        
                        DividerWithActionsVstack(actions: [
                            NavigationLink{
                                CrewInfoFlightCrewOfpScreen(heading: "Pilot in command",flightCrewViewModel: flightCrewViewModel)
                            }label:{
                                TextTextIconHStack(leftText: AppTexts.pilotInCommand, rightText: "NYG")
                            }
                                .accentColor(Color.black.opacity(AppConstants.defaultOpacity))
                                .toAnyView(),
                            
                            NavigationLink{
                                CrewInfoFlightCrewOfpScreen(heading: "Crew member",flightCrewViewModel: flightCrewViewModel)
                            }label:{
                                TextTextIconHStack(leftText: "Crew member", rightText: "LAU")
                            }
                                .accentColor(Color.black.opacity(AppConstants.defaultOpacity))
                                .toAnyView()
                        ])
                        
                        .background(.white)
                        
                        Spacer()
                    }
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}
#Preview {
    FlightCrewDetailScreenOfpScreen()
}
