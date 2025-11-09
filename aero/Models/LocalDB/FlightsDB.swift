//
//  FlightDB.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/07/24.
//

import Foundation
import SwiftData

@Model
class FlightsDB {
    var id: Int
    var operator_id: Int
    var user_id: Int?
    var pps: String?
    var number: String?
    var dep: String
    var dep_iata: String?
    var dest: String
    var dest_iata: String?
    var std: Date
    var sta: Date?
    var prepared_at: Date
    var aircraft_id: Int?
    var aircraft_registration: String?
    var aircraft_type: String?
    var revised: Bool
    var status: String
    var uuid: String
    var flight_type: String
    var uom_altitude: String
    var uom_distance: String
    var uom_length: String
    var uom_moment_arm: String
    var uom_volume: String
    var uom_weight: String
    var uom_pressure: String
    var uom_speed: String
    var uom_vertical_speed: String
    var uom_flow: String
    var uom_temperature: String
    var uom_fuel_density: String
    var trip_number: String?
    var ofp_type: String
    var archived_at: Date?
    var deleted_at: Date?
    var created_at: Date?
    var updated_at: Date?
    var edited_at: Date
    
    // Initialize all properties
    init(id: Int, operator_id: Int, user_id: Int? = nil, pps: String? = nil, number: String? = nil,
         dep: String, dep_iata: String? = nil, dest: String, dest_iata: String? = nil,
         std: Date, sta: Date? = nil, prepared_at: Date, aircraft_id: Int? = nil,
         aircraft_registration: String? = nil, aircraft_type: String? = nil, revised: Bool,
         status: String, uuid: String, flight_type: String, uom_altitude: String, uom_distance: String,
         uom_length: String, uom_moment_arm: String, uom_volume: String, uom_weight: String,
         uom_pressure: String, uom_speed: String, uom_vertical_speed: String, uom_flow: String,
         uom_temperature: String, uom_fuel_density: String, trip_number: String? = nil,
         ofp_type: String, archived_at: Date? = nil, deleted_at: Date? = nil,
         created_at: Date? = nil, updated_at: Date? = nil, edited_at: Date) {
        
        self.id = id
        self.operator_id = operator_id
        self.user_id = user_id
        self.pps = pps
        self.number = number
        self.dep = dep
        self.dep_iata = dep_iata
        self.dest = dest
        self.dest_iata = dest_iata
        self.std = std
        self.sta = sta
        self.prepared_at = prepared_at
        self.aircraft_id = aircraft_id
        self.aircraft_registration = aircraft_registration
        self.aircraft_type = aircraft_type
        self.revised = revised
        self.status = status
        self.uuid = uuid
        self.flight_type = flight_type
        self.uom_altitude = uom_altitude
        self.uom_distance = uom_distance
        self.uom_length = uom_length
        self.uom_moment_arm = uom_moment_arm
        self.uom_volume = uom_volume
        self.uom_weight = uom_weight
        self.uom_pressure = uom_pressure
        self.uom_speed = uom_speed
        self.uom_vertical_speed = uom_vertical_speed
        self.uom_flow = uom_flow
        self.uom_temperature = uom_temperature
        self.uom_fuel_density = uom_fuel_density
        self.trip_number = trip_number
        self.ofp_type = ofp_type
        self.archived_at = archived_at
        self.deleted_at = deleted_at
        self.created_at = created_at
        self.updated_at = updated_at
        self.edited_at = edited_at
    }
}
