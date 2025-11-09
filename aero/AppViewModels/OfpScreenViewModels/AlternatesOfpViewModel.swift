//
//  AlternatesOfpViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/12/24.
//

import Foundation

class AlternatesOfpViewModel: ObservableObject{
    @Published var adequateAirportList: String = ""
    
    // Planning
    let metarData: [String] = []
    @Published var planingRvr: String = ""
    @Published var planingCeiling: String = ""
    @Published var runwayFacilities: String = ""
    @Published var catIlsLoc: String = ""
    
    // Runway
    @Published var runway: String = ""
    
    // Facilities
    @Published var fibnFacilities: String = ""
    @Published var catIlsLocFacilities: String = ""
    
    // Visibility Rvr
    @Published var visiblity: String = ""
    @Published var rvr: String = ""
    
    @Published var ceiling: String = ""
    
    let fibnFacilitiesList : [String] = ["F : Full", "I : Intermediate", "B : Basic", "N : Nill"]
    let catIlsList: [String] = ["CAT II", "ILS", "LOC", "VOR", "NDB", "LPV", "RNAV", "Circling", "Visual"]
    let runwayList: [String] = ["RWY 11 / 799 m", "RWY 17 / 2800 m", "RWY 29 / 799 m", "RWY 35 / 2800 m"]
    
    let metarText: String = "240920Z 25003KT 9999 BKN031 04/03 Q1021="
    let tafText: String = "240812Z 2409/2509 VRB03KT 9999 BKN025 BECMG 2422/2501 20010KT 4000 -RADZ BKN008 TEMPO 2501/2505 2000 BR BKN004 BECMG 2505/2507 0200 FG V001 TEMPO 2507/2509 2000 DZ BR BKN003="
    
}
