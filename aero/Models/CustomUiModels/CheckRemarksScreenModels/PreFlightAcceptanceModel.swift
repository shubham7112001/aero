//
//  PreFlightAcceptanceModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/09/24.
//

import Foundation
import SwiftData

@Model
class PreFlightAcceptanceModel{
    var acceptance : String?
    var checklists : [String]?
    var typeOfOperation : String?
    var pilotFlying : String?
    var deicing : String?
    var fuel : String?
    var drawing: [Line]?
    
    init(acceptance: String? = nil, checklists: [String]? = nil, typeOfOperation: String? = nil, pilotFlying: String? = nil, deicing: String? = nil, fuel: String? = nil, drawing: [Line]? = nil) {
        self.acceptance = acceptance
        self.checklists = checklists
        self.typeOfOperation = typeOfOperation
        self.pilotFlying = pilotFlying
        self.deicing = deicing
        self.fuel = fuel
        self.drawing = drawing
    }
    
}
