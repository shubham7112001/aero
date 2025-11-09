//
//  PlannedFuelRowModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/12/24.
//

import Foundation

class PlannedFuelRowModel: ObservableObject, Identifiable{
    
    let id = UUID()
    var heading: String
    
    @Published var time: Date{
        didSet{
            updateResultant()
        }
    }

    @Published var weight: String {
        didSet{
            updateResultant()
        }
    }
    
    @Published var volume: String
    
    @Published var fuelFlow: String
    @Published var fuelType: String
    
    var fuelReasons: [String] 
    
    let paragraphText: String = "The fuel units are automatically calculated as interdependent, based on below fuel flow and density."
    @Published var resultant: String
    var alternates: String = ""
    
    init(heading: String = "Heading", time: Date = Date.now, weight: String = "", volume: String = "", fuelFlow: String = "", fuelType: String = "" , fuelReasons: [String] = ["Low altitude", "Route conditions", "Icy conditions", "Weather", "ATC delay", "Tankering", "Destination holding", "Ballast", "Over-fuelled"], resultant: String = "00:00 / 0", alternates: String = "") {
        self.heading = heading
        self.time = time
        self.weight = weight
        self.volume = volume
        self.fuelFlow = fuelFlow
        self.fuelType = fuelType
        self.fuelReasons = fuelReasons
        self.resultant = "\(DateTimeFunctions.onlyTimeReadable(time)) / \(weight.isEmpty ? "0" : weight) lb"
        self.alternates = alternates
    }
    
    
    private func updateResultant(){
        resultant = "\(DateTimeFunctions.onlyTimeReadable(time)) / \(weight.isEmpty ? "0" : weight) lb"
    }

    
}
