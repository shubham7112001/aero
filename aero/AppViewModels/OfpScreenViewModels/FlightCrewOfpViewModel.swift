//
//  FlightCrewOfpViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/12/24.
//

import Foundation

class FlightCrewOfpViewModel: ObservableObject{
    @Published var flightIdLogNo: String = ""
    @Published var dofStd: String = ""
    @Published var ofpPreparedBy: String = ""
    @Published var gufi: String = ""
    
    // Aircraft
    
    @Published var aircraftRegistration: String = ""
    @Published var aircraftType: String = ""
    @Published var aircraftSerialNo: String = ""
    
    // Configuration
    @Published var configuration: String = ""
    
    
    // Type of operation
    @Published var typeOfOperationScheduled: String = ""
    @Published var typeOfOperationCommercial: String = ""
    @Published var typeOfOperationIfrVfr: String = ""
    @Published var typeOfOperationOthers: String = ""
    
    // Airports
    @Published var departure: AirportInfo = AirportInfo()
    @Published var destination: AirportInfo = AirportInfo()
    @Published var alternate: AirportInfo = AirportInfo()
    
    // Pilot and Crew
    @Published var pilot: PilotDutyInfo = PilotDutyInfo()
    @Published var crew: PilotDutyInfo = PilotDutyInfo()
    
    let scheduleList = ["Scheduled", "Non-scheduled"]
    let commercialList = ["Commercial", "Non-commercial"]
    let ifrVfrList = ["IFR", "IFR/VFR", "VFR"]
    let operationList = ["CHT", "EROPS", "FERRY", "HOSP", "PVT", "TECH", "TRAIN"]
    let pilotFlyingList = ["Pilot flying", "Pilot monitoring"]
    let approachTypeList = ["", "Autoland", "Steep", "Non-precision"]
    
    
}

class AirportInfo: ObservableObject {
    @Published var icao: String = ""
    @Published var iata: String = ""
    @Published var name: String = ""
    @Published var elevation: String = ""
    @Published var latitude: String = ""
    @Published var longitude: String = ""
    @Published var runways: [String: String] = [
        "RWY 14": "1230m",
        "RWY 15": "1212m",
        "RWY 16": "1500m",
        "RWY 17": "1000m",
        "RWY 18": "980m",
        "RWY 19": "2000m"
    ]
    
}

class PilotDutyInfo: ObservableObject {
    @Published var pilotInCommand: String = ""
    @Published var flyingMonitoring: String = ""
    @Published var approachType: String = ""
    @Published var dutyOn: Date = Date()
    @Published var dutyOff: Date = Date()
    @Published var rest: Date = Date()
    @Published var dutyStart: Date = Date()
    @Published var dutyEnd: Date = Date()
    @Published var isFdpExtension: Bool = false
    
}
