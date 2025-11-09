//
//  FlightAirportDB.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/07/24.
//

import Foundation
import SwiftData

@Model
class FlightAirportDB {
    var id: Int
    var flight_id: Int
    var descriptions: String
    var type: String
    var route_description: String?
    var route_distance: Int?
    var icao: String
    var iata: String?
    var name: String?
    var elev: Int?
    var rwy_planned: String?
    var rwyl_planned: Int?
    var fac_planned: String?
    var rvr_planned: Double?
    var ceil_planned: Double?
    var rwy: String?
    var rwyl: Int?
    var braking_action: String?
    var fac: String?
    var wv_w: Int?
    var wv_v: Int?
    var gust: Int?
    var visibility: Double?
    var rvr: Double?
    var ceil: Double?
    var temperature: Int?
    var dewpoint: Int?
    var qnh: Int?
    var lat: Double?
    var lon: Double?
    var runways: String?
    var atis_string: String?
    var atis_json: String?
    var metar: String?
    var taf_type: String?
    var taf_text: String?
    
    // Initialize all properties
    init(id: Int, flight_id: Int, descriptions: String, type: String, route_description: String? = nil,
         route_distance: Int? = nil, icao: String, iata: String? = nil, name: String? = nil,
         elev: Int? = nil, rwy_planned: String? = nil, rwyl_planned: Int? = nil, fac_planned: String? = nil,
         rvr_planned: Double? = nil, ceil_planned: Double? = nil, rwy: String? = nil, rwyl: Int? = nil,
         braking_action: String? = nil, fac: String? = nil, wv_w: Int? = nil, wv_v: Int? = nil,
         gust: Int? = nil, visibility: Double? = nil, rvr: Double? = nil, ceil: Double? = nil,
         temperature: Int? = nil, dewpoint: Int? = nil, qnh: Int? = nil, lat: Double? = nil,
         lon: Double? = nil, runways: String? = nil, atis_string: String? = nil, atis_json: String? = nil,
         metar: String? = nil, taf_type: String? = nil, taf_text: String? = nil) {
        
        self.id = id
        self.flight_id = flight_id
        self.descriptions = descriptions
        self.type = type
        self.route_description = route_description
        self.route_distance = route_distance
        self.icao = icao
        self.iata = iata
        self.name = name
        self.elev = elev
        self.rwy_planned = rwy_planned
        self.rwyl_planned = rwyl_planned
        self.fac_planned = fac_planned
        self.rvr_planned = rvr_planned
        self.ceil_planned = ceil_planned
        self.rwy = rwy
        self.rwyl = rwyl
        self.braking_action = braking_action
        self.fac = fac
        self.wv_w = wv_w
        self.wv_v = wv_v
        self.gust = gust
        self.visibility = visibility
        self.rvr = rvr
        self.ceil = ceil
        self.temperature = temperature
        self.dewpoint = dewpoint
        self.qnh = qnh
        self.lat = lat
        self.lon = lon
        self.runways = runways
        self.atis_string = atis_string
        self.atis_json = atis_json
        self.metar = metar
        self.taf_type = taf_type
        self.taf_text = taf_text
    }
}
