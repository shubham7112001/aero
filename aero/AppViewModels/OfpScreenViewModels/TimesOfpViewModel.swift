//
//  TimesOfpViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/12/24.
//

import Foundation

class TimesOfpViewModel: ObservableObject{
    @Published var scheduledTimeOfDeparture: Date = Date()
    @Published var scheduledTakeOffTime: Date = Date()
    @Published var scheduledTimeOfArrival: Date = Date()
    
    // Delay Codes
    @Published var basicArray: [Bool] = Array(repeating: false, count: 143)
    @Published var extendedArray: [String?] = Array(repeating: nil, count: 143)
    @Published var selected : Int  = 0
    @Published var headingIdx : Int = 0
    @Published var showAlert: Bool = false
    
    // Block Times
    @Published var offBlock: Date = Date()
    @Published var onBlock: Date = Date()
    @Published var blockTime: Date = Date()
    
    // Flight Times
    @Published var airborne: Date = Date()
    @Published var landed: Date = Date()
    @Published var flightTime: Date = Date()
    
    // TTSN Flights
    @Published var ttsnPreFlight: String = ""
    @Published var ttsnPostFlight: String = ""
    
    // Cycles
    @Published var landings: String = ""
    @Published var preFlightCycles: String = ""
    @Published var totalAircraftCycles: String = ""
    @Published var engine: String = ""
    
    
}
