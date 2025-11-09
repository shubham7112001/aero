//
//  WaypointsOfpViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/12/24.
//

import Foundation

class WaypointsOfpViewModel: ObservableObject{
    @Published var remarks: String = ""
    @Published var sequenceId: String = ""
    @Published var airwayFir: String = ""
    @Published var position: String = ""
    @Published var identTypeFreq: String = ""
    @Published var latLon: String = ""
    
    @Published var mt: String = ""
    @Published var tt: String = ""
    @Published var fl: String = ""
    @Published var mora: String = ""
    @Published var distanceAcc: String = ""
    @Published var timeAcc: String = ""
    
    @Published var eto: String = ""
    @Published var reto: String = ""
    @Published var ato: String = ""
    
    @Published var tas: String = ""
    @Published var gs: String = ""
    @Published var weight: String = ""
    @Published var volume: String = ""
    @Published var wc: String = ""
    @Published var cat: String = ""
    @Published var isa: String = ""
    @Published var sat: String = ""
    
    @Published var fuelFlow: String = ""
    @Published var fuelUsedAcc: String = ""
    @Published var fuelRemaining: String = ""
    @Published var fuelMinimumRequired: String = ""
    
    
    
}
