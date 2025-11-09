//
//  taillogApp.swift
//  taillog
//
//  Created by Sword Software on 24/06/24.
//

import SwiftUI
import SwiftData

@main
struct Taillog: App {
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                SplashScreen()
                
                CustomManagerHandlerView()
            }
        }
        .modelContainer(for: [
            FlightsDB.self,
            FlightAirportDB.self,
            FlightCrewDB.self,
            FlightDataDB.self,
            FlightWaypointsDB.self,
            DeicingModel.self,
            DeicingStepModel.self,
            OperationTypeModel.self,
            GeneralRemarksAndPhotosModel.self,
            FuelRefuellingModel.self,
            PreFlightAcceptanceModel.self,
            LoginDB.self
        ])
    }
}

