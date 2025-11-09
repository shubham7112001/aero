//
//  TableModelFlightProgressScreen.swift
//  taillog
//
//  Created by Sword Software on 28/06/24.
//

import Foundation

struct FlightProgressTableModel : Identifiable{
    var id = UUID()
    let fir: String
    let airway: String
    let mt: String
    let tt: String
    let distance: String
    let accuracy: String
    let fl: String
    let ma: String
    let waypoint: String
    let identTypeFreq: String
    let time: String
    let eto: String
    let reto: String
    let ato: String
    let tas: String
    let gs: String
    let windVelocity: String
    let windComponent: String
    let cat: String
    let isa: String
    let sat: String
    let remaining: String
    let actual: String
    let min: String
    let diff: String
}
