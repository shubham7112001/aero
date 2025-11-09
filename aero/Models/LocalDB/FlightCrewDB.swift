//
//  FlightCrewDB.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/07/24.
//

import Foundation
import SwiftData

@Model
class FlightCrewDB{
    var id: Int
    var flight_id: Int
    var type: String
    var descriptions: String
    var display: String
    var name: String?
    var code: String?
    var duty_on: Date?
    var duty_off: Date?
    var rest: Int?  // minutes
    var split_duty_start_time: Date?
    var split_duty_end_time: Date?
    var fdp_extension: Bool?  // Boolean represented as Int in MySQL
    
    // Initialize all properties
    init(id: Int, flight_id: Int, type: String, descriptions: String, display: String, name: String? = nil,
         code: String? = nil, duty_on: Date? = nil, duty_off: Date? = nil, rest: Int? = nil,
         split_duty_start_time: Date? = nil, split_duty_end_time: Date? = nil, fdp_extension: Bool? = nil) {
        
        self.id = id
        self.flight_id = flight_id
        self.type = type
        self.descriptions = descriptions
        self.display = display
        self.name = name
        self.code = code
        self.duty_on = duty_on
        self.duty_off = duty_off
        self.rest = rest
        self.split_duty_start_time = split_duty_start_time
        self.split_duty_end_time = split_duty_end_time
        self.fdp_extension = fdp_extension
    }
}
