//
//  FlightWaypointsDB.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/07/24.
//

import Foundation
import SwiftData

@Model
class FlightWaypointsDB {
    var id: Int
    var flight_id: Int
    var wp_id: Int
    var status: Int
    var route: Int
    var type: Int
    var fir_1: String
    var fir_2: String
    var airway: String
    var variation: Int
    var magnetic_track: Int
    var true_track: Int
    var distance_leg: Int
    var distance_accumulated: Int
    var distance_remaining: Int
    var position_ident_1: String
    var position_ident_2: String
    var position_type: String
    var position_frequency: Double?
    var time_leg: Int // In minutes
    var time_accumulated: Int // In minutes
    var time_remaining: Int // In minutes
    var eto: Date?
    var reto: Date?
    var ato: Date?
    var fl: Int // In hecto feet
    var climb_descent: String?
    var mora: Int
    var tas: Int?
    var gs: Int?
    var wv_w: Int
    var wv_v: Int
    var wv_wc_dir: String
    var wv_wc_qty: Int
    var wv_cat: Int?
    var sat: Int?
    var isa_data: Int?
    var temperature: Int
    var fuel_flow: Int
    var fuel_flow_eng: Int
    var fuel_leg: Int
    var fuel_used_accumulated: Int
    var fuel_rem: Int
    var fuel_rem_ind: Int?
    var fuel_rem_calc: Int?
    var fuel_req_min: Int
    var lat: Double
    var lon: Double
    var remarks: String
    var meta: String
    var landing_time: Date?
    var engine_off_time: Date?
    var engine_on_time: Date?
    var pax: Int?
    var pax_weight: Double?
    var cargo_weight: Double?
    var landing_fuel: Double?
    var uplift_fuel: Double?

    
    init(id: Int, flight_id: Int, wp_id: Int, status: Int, route: Int, type: Int, fir_1: String, fir_2: String, airway: String, variation: Int, magnetic_track: Int, true_track: Int, distance_leg: Int, distance_accumulated: Int, distance_remaining: Int, position_ident_1: String, position_ident_2: String, position_type: String, position_frequency: Double?, time_leg: Int, time_accumulated: Int, time_remaining: Int, eto: Date?, reto: Date?, ato: Date?, fl: Int, climb_descent: String?, mora: Int, tas: Int?, gs: Int?, wv_w: Int, wv_v: Int, wv_wc_dir: String, wv_wc_qty: Int, wv_cat: Int?, sat: Int?, isa_data: Int?, temperature: Int, fuel_flow: Int, fuel_flow_eng: Int, fuel_leg: Int, fuel_used_accumulated: Int, fuel_rem: Int, fuel_rem_ind: Int?, fuel_rem_calc: Int?, fuel_req_min: Int, lat: Double, lon: Double, remarks: String, meta: String, landing_time: Date?, engine_off_time: Date?, engine_on_time: Date?, pax: Int?, pax_weight: Double?, cargo_weight: Double?, landing_fuel: Double?, uplift_fuel: Double?) {
        self.id = id
        self.flight_id = flight_id
        self.wp_id = wp_id
        self.status = status
        self.route = route
        self.type = type
        self.fir_1 = fir_1
        self.fir_2 = fir_2
        self.airway = airway
        self.variation = variation
        self.magnetic_track = magnetic_track
        self.true_track = true_track
        self.distance_leg = distance_leg
        self.distance_accumulated = distance_accumulated
        self.distance_remaining = distance_remaining
        self.position_ident_1 = position_ident_1
        self.position_ident_2 = position_ident_2
        self.position_type = position_type
        self.position_frequency = position_frequency
        self.time_leg = time_leg
        self.time_accumulated = time_accumulated
        self.time_remaining = time_remaining
        self.eto = eto
        self.reto = reto
        self.ato = ato
        self.fl = fl
        self.climb_descent = climb_descent
        self.mora = mora
        self.tas = tas
        self.gs = gs
        self.wv_w = wv_w
        self.wv_v = wv_v
        self.wv_wc_dir = wv_wc_dir
        self.wv_wc_qty = wv_wc_qty
        self.wv_cat = wv_cat
        self.sat = sat
        self.isa_data = isa_data
        self.temperature = temperature
        self.fuel_flow = fuel_flow
        self.fuel_flow_eng = fuel_flow_eng
        self.fuel_leg = fuel_leg
        self.fuel_used_accumulated = fuel_used_accumulated
        self.fuel_rem = fuel_rem
        self.fuel_rem_ind = fuel_rem_ind
        self.fuel_rem_calc = fuel_rem_calc
        self.fuel_req_min = fuel_req_min
        self.lat = lat
        self.lon = lon
        self.remarks = remarks
        self.meta = meta
        self.landing_time = landing_time
        self.engine_off_time = engine_off_time
        self.engine_on_time = engine_on_time
        self.pax = pax
        self.pax_weight = pax_weight
        self.cargo_weight = cargo_weight
        self.landing_fuel = landing_fuel
        self.uplift_fuel = uplift_fuel
    }
}
