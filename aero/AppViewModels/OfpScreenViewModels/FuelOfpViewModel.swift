//
//  FuelOfpViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 30/12/24.
//

import SwiftUI


class FuelOfpViewModel: ObservableObject{
    
    @Published var wvSelectedPicker: Int = 0{
        didSet(newValue){
            wvSuffixText = newValue == 1 ? "lb" : "L"
        }
    }
    
    
    @Published var remainingLastFlight: String = ""
    @Published var uplift: String = ""
    @Published var ramp: String = ""
    @Published var rampGallons: String = ""
    
    @Published var takeOff: String = ""
    
    @Published var remainingAfterFlightCompletion: String = ""
    
    @Published var wvSuffixText: String = "L"
    // Refuelling Section
    @Published var refuellingDestination: FuelRefuellingOfpViewModel = FuelRefuellingOfpViewModel();
    @Published var refuellingDeparture: FuelRefuellingOfpViewModel = FuelRefuellingOfpViewModel();
    
    @Published var plannedFuelList: [PlannedFuelRowModel] = [
        
        PlannedFuelRowModel(heading: "Trip"),
        PlannedFuelRowModel(heading: "Taxi"),
        PlannedFuelRowModel(heading: "Burned"),
        PlannedFuelRowModel(heading: "Contingency MCF"),
        PlannedFuelRowModel(heading: "ALT1 : ESMS"),
        PlannedFuelRowModel(heading: "Final reserve"),
        PlannedFuelRowModel(heading: "Additional"),
        PlannedFuelRowModel(heading: "Extra"),
        PlannedFuelRowModel(heading: "Minimum required"),
        PlannedFuelRowModel(heading: "Discretionary"),
        PlannedFuelRowModel(heading: "Ramp planned")
    ]
    
    
    var plannedFuelData: [PlannedFuelDataModel] = [
        PlannedFuelDataModel(fl: 450, wc: 26, time: "01:01", fuel: 1849, oneTon: 62, costDiff: 30),
        PlannedFuelDataModel(fl: 410, wc: 25, time: "01:02", fuel: 1838, oneTon: 58, costDiff: 30),
        PlannedFuelDataModel(fl: 390, wc: 25, time: "01:02", fuel: 1884, oneTon: 50, costDiff: 30),
        PlannedFuelDataModel(fl: 370, wc: 24, time: "01:02", fuel: 1927, oneTon: 46, costDiff: 30),
        PlannedFuelDataModel(fl: 350, wc: 24, time: "01:02", fuel: 1986, oneTon: 45, costDiff: 30),
        PlannedFuelDataModel(fl: 330, wc: 24, time: "01:00", fuel: 2044, oneTon: 37, costDiff: 30),
        PlannedFuelDataModel(fl: 310, wc: 22, time: "00:59", fuel: 2127, oneTon: 36, costDiff: 30),
        PlannedFuelDataModel(fl: 290, wc: 22, time: "00:59", fuel: 2192, oneTon: 46, costDiff: 30),
        PlannedFuelDataModel(fl: 270, wc: 24, time: "01:01", fuel: 2294, oneTon: 34, costDiff: 30),
        PlannedFuelDataModel(fl: 250, wc: 24, time: "00:58", fuel: 2399, oneTon: 27, costDiff: 30),
        PlannedFuelDataModel(fl: 230, wc: 23, time: "01:02", fuel: 2406, oneTon: 23, costDiff: 30)
    ]
    
   // DENSITY
    
    /*
      0 -> Default density
      1 -> Refuelling departure density
      2 -> Refuelling destination density
     */
    
    @Published var densityFuels: [String] = ["", "", ""]
    
}
