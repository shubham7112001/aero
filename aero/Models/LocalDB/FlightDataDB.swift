//
//  FlightDataDB.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/07/24.
//

import Foundation
import SwiftData

@Model
class FlightDataDB{
    var id: Int
    var flight_id: Int
    var route: Int
    var user_remarks: String?
    var icfa_remarks: String?
    var technical_log_no: String?
    var sign_date: Date?
    var pic_sign_date: Date?
    var sign_by_pin: Bool // Boolean represented as Int in MySQL
    var security_search_check: Bool?
    var check_cat_2: Bool?
    var successfull_cat_2: Bool?
    var unsuccessfull_cat_2: String?
    var flight_plan_id: String?
    var dispatcher: String?
    var gufi: String?
    var aircraft_config: String?
    var operations_type: String
    var pic_flying: Bool?
    var pic_to: Bool?
    var day_to: Bool?
    var pic_instrument_approach: Bool?
    var instrument_approach_info: String?
    var pic_ld: Bool?
    var day_ld: Bool?
    var landing_dist_reqd: Int?
    var landing_dist_avail: Int?
    var dispatch_msg: String?
    var fms_ident: String?
    var dep_cat: String?
    var dest_cat: String?
    var alt1_cat: String?
    var alt2_cat: String?
    var era_cat: String?
    var toalt_cat: String?
    var hora_departure: Int?
    var hora_arrival: Int?
    var alt2AsInfoOnly: Bool
    var atc_ctot: String?
    var ctot_updated_at: Date?
    var times_ctot: Date?
    var eta: Date?
    var delay_codes: String?
    var times_off: Date?
    var times_on: Date?
    var times_blk: Int?
    var times_airb: Date?
    var times_land: Date?
    var times_flt: Int?
    var landing_cycles: Int?
    var aircraft_cycles_pre_flight: Int?
    var ttsn: Int?
    var atc_route: String?
    var atc_status: String?
    var route_fir_trans: String?
    var route_climb: String?
    var route_cruise: String?
    var route_descend: String?
    var route_hold: String?
    var aircraft_cruise_profiles: String?
    var route_distance: Int?
    var route_gcd: Int?
    var route_ratio: Double?
    var route_fl: Int?
    var route_fl_min: Int?
    var route_fl_max: Int?
    var route_tt_avg: Int?
    var route_wv_vcomp: Int?
    var enroute_text: String?
    var temp_toc: Int?
    var to_airport: String
    var to_settings: String
    var ld_airport: String
    var engine_time: Int?
    var ld_settings: String
    var oil_uplift_left: Double?
    var oil_uplift_center: Double?
    var oil_uplift_right: Double?
    var oil_uplift_apu: Double?
    var prist_litres_uplift: Double?
    var fuel_trip: Int?
    var fuel_trip_time: Int?
    var fuel_taxi: Int?
    var fuel_taxi_time: Int?
    var fuel_cont: Int?
    var fuel_cont_time: Int?
    var fuel_cont_pct: String?
    var fuel_alt1: Int?
    var fuel_alt1_time: Int?
    var fuel_alt2: Int?
    var fuel_alt2_time: Int?
    var fuel_hold: Int?
    var fuel_hold_time: Int?
    var fuel_comp: Int?
    var fuel_comp_time: Int?
    var fuel_ramp_min: Int?
    var fuel_additional: Int?
    var fuel_holding: Int?
    var fuel_holding_time: Int?
    var fuel_comp_extra: Int?
    var fuel_comp_extra_time: Int?
    var fuel_additional_time: Int?
    var fuel_extra: Int?
    var fuel_extra_time: Int?
    var fuel_ramp: Int?
    var fuel_ramp_time: Int?
    var fuel_extra_corrected: Int?
    var fuel_discretionary: Int?
    var fuel_required: Int?
    var fuel_dest_min: Int?
    var fuel_ld: Int?
    var touchdown_weight: Int?
    var fuel_gain_loss: String
    var fuel_correction: String?
    var fuel_last_flight: Int?
    var fuel_burned_before_uplift: Int?
    var fuel_before_uplift: Int?
    var fuel_uplift: Int?
    var fuel_ramp_actual: Int?
    var fuel_burned_after_uplift: Int?
    var fuel_engine_on: Int?
    var fuel_take_off: Int?
    var fuel_burned_engine: Int?
    var fuel_on_block: Int?
    var fuel_burned_after_engineoff: Int?
    var fuel_after_flight: Int?
    var fuel_burned_total: Int?
    var fuel_trip_actual: Int?
    var fuel_ramp_max: Int?
    var fuel_type: String?
    var fuel_density: Double
    var remark_extra_fuel_consumption: String?
    var reason_extra_fuel: String?
    var reason_additional_fuel: String?
    var reason_tech_log_change: String?
    var pax: Int
    var pax_male: Int
    var pax_female: Int
    var pax_child: Int
    var pax_infant: Int
    var dest2: String?
    var dest3: String?
    var pax_qty_dest1: Int?
    var pax_qty_dest2: Int?
    var pax_qty_dest3: Int?
    var weight_pax: Int
    var weight_cargo: Int
    var weight_bo: Int?
    var weight_payload: Int?
    var weight_zf: Int?
    var weight_zf_max: Int?
    var weight_ramp: Int?
    var weight_ramp_max: Int?
    var weight_to: Int?
    var weight_to_max: Int?
    var weight_to_max_regulated: Int?
    var weight_ld: Int?
    var weight_ld_max: Int?
    var weight_ld_max_regulated: Int?
    var fir_list: String?
    var adequate_airport_list: String?
    var alternate_airport_list: String?
    var weather_updated_at: Date
    var documents_updated_at: Date?
    var sid_procedure: String?
    var star_procedure: String?
    var app_config: String?
    var change_log: String?
    var created_at: Date?
    var updated_at: Date?

    // Initialize all properties
    init(id: Int, flight_id: Int, route: Int, user_remarks: String? = nil, icfa_remarks: String? = nil,
         technical_log_no: String? = nil, sign_date: Date? = nil, pic_sign_date: Date? = nil,
         sign_by_pin: Bool, security_search_check: Bool? = nil, check_cat_2: Bool? = nil,
         successfull_cat_2: Bool? = nil, unsuccessfull_cat_2: String? = nil, flight_plan_id: String? = nil,
         dispatcher: String? = nil, gufi: String? = nil, aircraft_config: String? = nil,
         operations_type: String, pic_flying: Bool? = nil, pic_to: Bool? = nil, day_to: Bool? = nil,
         pic_instrument_approach: Bool? = nil, instrument_approach_info: String? = nil, pic_ld: Bool? = nil,
         day_ld: Bool? = nil, landing_dist_reqd: Int? = nil, landing_dist_avail: Int? = nil,
         dispatch_msg: String? = nil, fms_ident: String? = nil, dep_cat: String? = nil, dest_cat: String? = nil,
         alt1_cat: String? = nil, alt2_cat: String? = nil, era_cat: String? = nil, toalt_cat: String? = nil,
         hora_departure: Int? = nil, hora_arrival: Int? = nil, alt2AsInfoOnly: Bool, atc_ctot: String? = nil,
         ctot_updated_at: Date? = nil, times_ctot: Date? = nil, eta: Date? = nil, delay_codes: String? = nil,
         times_off: Date? = nil, times_on: Date? = nil, times_blk: Int? = nil, times_airb: Date? = nil,
         times_land: Date? = nil, times_flt: Int? = nil, landing_cycles: Int? = nil,
         aircraft_cycles_pre_flight: Int? = nil, ttsn: Int? = nil, atc_route: String? = nil,
         atc_status: String? = nil, route_fir_trans: String? = nil, route_climb: String? = nil,
         route_cruise: String? = nil, route_descend: String? = nil, route_hold: String? = nil,
         aircraft_cruise_profiles: String? = nil, route_distance: Int? = nil, route_gcd: Int? = nil,
         route_ratio: Double? = nil, route_fl: Int? = nil, route_fl_min: Int? = nil, route_fl_max: Int? = nil,
         route_tt_avg: Int? = nil, route_wv_vcomp: Int? = nil, enroute_text: String? = nil, temp_toc: Int? = nil,
         to_airport: String, to_settings: String, ld_airport: String, engine_time: Int? = nil,
         ld_settings: String, oil_uplift_left: Double? = nil, oil_uplift_center: Double? = nil,
         oil_uplift_right: Double? = nil, oil_uplift_apu: Double? = nil, prist_litres_uplift: Double? = nil,
         fuel_trip: Int? = nil, fuel_trip_time: Int? = nil, fuel_taxi: Int? = nil, fuel_taxi_time: Int? = nil,
         fuel_cont: Int? = nil, fuel_cont_time: Int? = nil, fuel_cont_pct: String? = nil,
         fuel_alt1: Int? = nil, fuel_alt1_time: Int? = nil, fuel_alt2: Int? = nil, fuel_alt2_time: Int? = nil,
         fuel_hold: Int? = nil, fuel_hold_time: Int? = nil, fuel_comp: Int? = nil, fuel_comp_time: Int? = nil,
         fuel_ramp_min: Int? = nil, fuel_additional: Int? = nil, fuel_holding: Int? = nil,
         fuel_holding_time: Int? = nil, fuel_comp_extra: Int? = nil, fuel_comp_extra_time: Int? = nil,
         fuel_additional_time: Int? = nil, fuel_extra: Int? = nil, fuel_extra_time: Int? = nil,
         fuel_ramp: Int? = nil, fuel_ramp_time: Int? = nil, fuel_extra_corrected: Int? = nil,
         fuel_discretionary: Int? = nil, fuel_required: Int? = nil, fuel_dest_min: Int? = nil, fuel_ld: Int? = nil,
         touchdown_weight: Int? = nil, fuel_gain_loss: String, fuel_correction: String? = nil,
         fuel_last_flight: Int? = nil, fuel_burned_before_uplift: Int? = nil, fuel_before_uplift: Int? = nil,
         fuel_uplift: Int? = nil, fuel_ramp_actual: Int? = nil, fuel_burned_after_uplift: Int? = nil,
         fuel_engine_on: Int? = nil, fuel_take_off: Int? = nil, fuel_burned_engine: Int? = nil,
         fuel_on_block: Int? = nil, fuel_burned_after_engineoff: Int? = nil, fuel_after_flight: Int? = nil,
         fuel_burned_total: Int? = nil, fuel_trip_actual: Int? = nil, fuel_ramp_max: Int? = nil,
         fuel_type: String? = nil, fuel_density: Double, remark_extra_fuel_consumption: String? = nil,
         reason_extra_fuel: String? = nil, reason_additional_fuel: String? = nil, reason_tech_log_change: String? = nil,
         pax: Int, pax_male: Int, pax_female: Int, pax_child: Int, pax_infant: Int,
         dest2: String? = nil, dest3: String? = nil, pax_qty_dest1: Int? = nil, pax_qty_dest2: Int? = nil,
         pax_qty_dest3: Int? = nil, weight_pax: Int, weight_cargo: Int, weight_bo: Int? = nil,
         weight_payload: Int? = nil, weight_zf: Int? = nil, weight_zf_max: Int? = nil, weight_ramp: Int? = nil,
         weight_ramp_max: Int? = nil, weight_to: Int? = nil, weight_to_max: Int? = nil,
         weight_to_max_regulated: Int? = nil, weight_ld: Int? = nil, weight_ld_max: Int? = nil,
         weight_ld_max_regulated: Int? = nil, fir_list: String? = nil, adequate_airport_list: String? = nil,
         alternate_airport_list: String? = nil, weather_updated_at: Date, documents_updated_at: Date? = nil,
         sid_procedure: String? = nil, star_procedure: String? = nil, app_config: String? = nil,
         change_log: String? = nil, created_at: Date? = nil, updated_at: Date? = nil) {
        
        self.id = id
        self.flight_id = flight_id
        self.route = route
        self.user_remarks = user_remarks
        self.icfa_remarks = icfa_remarks
        self.technical_log_no = technical_log_no
        self.sign_date = sign_date
        self.pic_sign_date = pic_sign_date
        self.sign_by_pin = sign_by_pin
        self.security_search_check = security_search_check
        self.check_cat_2 = check_cat_2
        self.successfull_cat_2 = successfull_cat_2
        self.unsuccessfull_cat_2 = unsuccessfull_cat_2
        self.flight_plan_id = flight_plan_id
        self.dispatcher = dispatcher
        self.gufi = gufi
        self.aircraft_config = aircraft_config
        self.operations_type = operations_type
        self.pic_flying = pic_flying
        self.pic_to = pic_to
        self.day_to = day_to
        self.pic_instrument_approach = pic_instrument_approach
        self.instrument_approach_info = instrument_approach_info
        self.pic_ld = pic_ld
        self.day_ld = day_ld
        self.landing_dist_reqd = landing_dist_reqd
        self.landing_dist_avail = landing_dist_avail
        self.dispatch_msg = dispatch_msg
        self.fms_ident = fms_ident
        self.dep_cat = dep_cat
        self.dest_cat = dest_cat
        self.alt1_cat = alt1_cat
        self.alt2_cat = alt2_cat
        self.era_cat = era_cat
        self.toalt_cat = toalt_cat
        self.hora_departure = hora_departure
        self.hora_arrival = hora_arrival
        self.alt2AsInfoOnly = alt2AsInfoOnly
        self.atc_ctot = atc_ctot
        self.ctot_updated_at = ctot_updated_at
        self.times_ctot = times_ctot
        self.eta = eta
        self.delay_codes = delay_codes
        self.times_off = times_off
        self.times_on = times_on
        self.times_blk = times_blk
        self.times_airb = times_airb
        self.times_land = times_land
        self.times_flt = times_flt
        self.landing_cycles = landing_cycles
        self.aircraft_cycles_pre_flight = aircraft_cycles_pre_flight
        self.ttsn = ttsn
        self.atc_route = atc_route
        self.atc_status = atc_status
        self.route_fir_trans = route_fir_trans
        self.route_climb = route_climb
        self.route_cruise = route_cruise
        self.route_descend = route_descend
        self.route_hold = route_hold
        self.aircraft_cruise_profiles = aircraft_cruise_profiles
        self.route_distance = route_distance
        self.route_gcd = route_gcd
        self.route_ratio = route_ratio
        self.route_fl = route_fl
        self.route_fl_min = route_fl_min
        self.route_fl_max = route_fl_max
        self.route_tt_avg = route_tt_avg
        self.route_wv_vcomp = route_wv_vcomp
        self.enroute_text = enroute_text
        self.temp_toc = temp_toc
        self.to_airport = to_airport
        self.to_settings = to_settings
        self.ld_airport = ld_airport
        self.engine_time = engine_time
        self.ld_settings = ld_settings
        self.oil_uplift_left = oil_uplift_left
        self.oil_uplift_center = oil_uplift_center
        self.oil_uplift_right = oil_uplift_right
        self.oil_uplift_apu = oil_uplift_apu
        self.prist_litres_uplift = prist_litres_uplift
        self.fuel_trip = fuel_trip
        self.fuel_trip_time = fuel_trip_time
        self.fuel_taxi = fuel_taxi
        self.fuel_taxi_time = fuel_taxi_time
        self.fuel_cont = fuel_cont
        self.fuel_cont_time = fuel_cont_time
        self.fuel_cont_pct = fuel_cont_pct
        self.fuel_alt1 = fuel_alt1
        self.fuel_alt1_time = fuel_alt1_time
        self.fuel_alt2 = fuel_alt2
        self.fuel_alt2_time = fuel_alt2_time
        self.fuel_hold = fuel_hold
        self.fuel_hold_time = fuel_hold_time
        self.fuel_comp = fuel_comp
        self.fuel_comp_time = fuel_comp_time
        self.fuel_ramp_min = fuel_ramp_min
        self.fuel_additional = fuel_additional
        self.fuel_holding = fuel_holding
        self.fuel_holding_time = fuel_holding_time
        self.fuel_comp_extra = fuel_comp_extra
        self.fuel_comp_extra_time = fuel_comp_extra_time
        self.fuel_additional_time = fuel_additional_time
        self.fuel_extra = fuel_extra
        self.fuel_extra_time = fuel_extra_time
        self.fuel_ramp = fuel_ramp
        self.fuel_ramp_time = fuel_ramp_time
        self.fuel_extra_corrected = fuel_extra_corrected
        self.fuel_discretionary = fuel_discretionary
        self.fuel_required = fuel_required
        self.fuel_dest_min = fuel_dest_min
        self.fuel_ld = fuel_ld
        self.touchdown_weight = touchdown_weight
        self.fuel_gain_loss = fuel_gain_loss
        self.fuel_correction = fuel_correction
        self.fuel_last_flight = fuel_last_flight
        self.fuel_burned_before_uplift = fuel_burned_before_uplift
        self.fuel_before_uplift = fuel_before_uplift
        self.fuel_uplift = fuel_uplift
        self.fuel_ramp_actual = fuel_ramp_actual
        self.fuel_burned_after_uplift = fuel_burned_after_uplift
        self.fuel_engine_on = fuel_engine_on
        self.fuel_take_off = fuel_take_off
        self.fuel_burned_engine = fuel_burned_engine
        self.fuel_on_block = fuel_on_block
        self.fuel_burned_after_engineoff = fuel_burned_after_engineoff
        self.fuel_after_flight = fuel_after_flight
        self.fuel_burned_total = fuel_burned_total
        self.fuel_trip_actual = fuel_trip_actual
        self.fuel_ramp_max = fuel_ramp_max
        self.fuel_type = fuel_type
        self.fuel_density = fuel_density
        self.remark_extra_fuel_consumption = remark_extra_fuel_consumption
        self.reason_extra_fuel = reason_extra_fuel
        self.reason_additional_fuel = reason_additional_fuel
        self.reason_tech_log_change = reason_tech_log_change
        self.pax = pax
        self.pax_male = pax_male
        self.pax_female = pax_female
        self.pax_child = pax_child
        self.pax_infant = pax_infant
        self.dest2 = dest2
        self.dest3 = dest3
        self.pax_qty_dest1 = pax_qty_dest1
        self.pax_qty_dest2 = pax_qty_dest2
        self.pax_qty_dest3 = pax_qty_dest3
        self.weight_pax = weight_pax
        self.weight_cargo = weight_cargo
        self.weight_bo = weight_bo
        self.weight_payload = weight_payload
        self.weight_zf = weight_zf
        self.weight_zf_max = weight_zf_max
        self.weight_ramp = weight_ramp
        self.weight_ramp_max = weight_ramp_max
        self.weight_to = weight_to
        self.weight_to_max = weight_to_max
        self.weight_to_max_regulated = weight_to_max_regulated
        self.weight_ld = weight_ld
        self.weight_ld_max = weight_ld_max
        self.weight_ld_max_regulated = weight_ld_max_regulated
        self.fir_list = fir_list
        self.adequate_airport_list = adequate_airport_list
        self.alternate_airport_list = alternate_airport_list
        self.weather_updated_at = weather_updated_at
        self.documents_updated_at = documents_updated_at
        self.sid_procedure = sid_procedure
        self.star_procedure = star_procedure
        self.app_config = app_config
        self.change_log = change_log
        self.created_at = created_at
        self.updated_at = updated_at
    }
}
