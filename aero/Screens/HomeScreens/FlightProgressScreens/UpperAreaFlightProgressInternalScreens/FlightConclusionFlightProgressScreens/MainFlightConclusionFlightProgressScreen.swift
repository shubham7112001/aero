//
//  MainFlightConclusionFlightProgressScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 13/12/24.
//

import SwiftUI

enum FlightConclusionFlightProgressEnum{
    case mainPage
    case checklists
    case delayCodes
    case fuel
    case altimeterRvsm
    case generalRemarks
}

class FlightConclusionViewModel: ObservableObject{
    @Published var currentRoutes : FlightConclusionFlightProgressEnum = .mainPage
}

struct MainFlightConclusionFlightProgressScreen: View {
    @StateObject var routes : FlightConclusionViewModel = FlightConclusionViewModel()
    @Binding var showSheet : Bool
    
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            FlightConclusionFlightProgressScreen(showSheet: $showSheet)
                .environmentObject(routes)
                .offset(x: routes.currentRoutes == .mainPage ? 0 : -200)
                .zIndex(0)
            
            if(routes.currentRoutes != .mainPage){
                VStack{
                    if(routes.currentRoutes == .checklists){
                        ChecklistsFlightConclusionScreen()
                            .environmentObject(routes)
                    }
                    else if(routes.currentRoutes == .delayCodes){
                        DelayCodesFlightConclusionScreen()
                            .environmentObject(routes)
                        
                    }else if(routes.currentRoutes == .fuel){
                        FuelFlightConclusionScreen()
                            .environmentObject(routes)
                        
                    }else if(routes.currentRoutes == .altimeterRvsm){
                        AltimeterRvsmFlightConclusionScreen()
                            .environmentObject(routes)
                        
                    }else if(routes.currentRoutes == .generalRemarks){
                        GeneralRemarksFlightConclusionScreen()
                            .environmentObject(routes)
                    }
                }
                .transition(.move(edge: .trailing))
                .zIndex(1)
            }
            
        }
        .animation(.easeOut(duration: 0.35), value: routes.currentRoutes)
        .frame(width: Dimensions.customSheetWidth, height: Dimensions.customSheetHeight)
    }
}

#Preview {
    MainFlightConclusionFlightProgressScreen(showSheet: .constant(true))
}
