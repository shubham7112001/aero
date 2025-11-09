//
//  TakeOffOfpViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import Foundation
import SwiftUI

class LandingTakeOffViewModel: ObservableObject{
    
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
    @Published var qnh: String = ""
    @Published var temperature: String = ""
    @Published var dewpoint: String = ""
    
    @Published var clearedWidth: String = "0"
    @Published var showClearedWidthPopover: Bool = false
    @Published var clearedWidthSelections: [Int] = [0 , 0]{
        didSet{
            clearedWidth = clearedWidth0to5[clearedWidthSelections[0]] + clearedWidth0to9[clearedWidthSelections[1]]
        }
    }
    

    // Wind part
    // 0 -> Direction, 1 -> Velcity , 2 -> Gust
    @Published var windInputs: [String] = ["", "", ""]
    
    
    @Published var maxRegulateWeight: String = ""
    
    // Deicing
    
    @Published var showHoldoverPopup: Bool = false;
    @Published var showStartTimePopup: Bool = false;
    
    @Published var holdoverTime: Date? = nil
    @Published var startTime: Date? = nil
    @Published var endTime: Date? = nil
    
    @Published var receiptNo: String = "";
    @Published var receiptSupplier: String = "";
    
    @Published var selectedImage: UIImage?
    
    // Deicing methods
    func enableStartTimePopup(){
        showStartTimePopup = true
    }
    func enableHoldoverPopup(){
        showHoldoverPopup = true
    }
    func enableClearedWidthPopover(){
        showClearedWidthPopover = true
    }
    
    
    let clearedWidth0to5: [String] = ["0", "1", "2", "3", "4", "5"]
    let clearedWidth0to9: [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    let fibnFacilitiesList : [String] = ["F : Full", "I : Intermediate", "B : Basic", "N : Nill"]
    let catIlsList: [String] = ["CAT II", "ILS", "LOC", "VOR", "NDB", "LPV", "RNAV", "Circling", "Visual"]
    let runwayList: [String] = ["RWY 11 / 799 m", "RWY 17 / 2800 m", "RWY 29 / 799 m", "RWY 35 / 2800 m"]
    
    let metarText: String = "240920Z 25003KT 9999 BKN031 04/03 Q1021="
    let tafText: String = "240812Z 2409/2509 VRB03KT 9999 BKN025 BECMG 2422/2501 20010KT 4000 -RADZ BKN008 TEMPO 2501/2505 2000 BR BKN004 BECMG 2505/2507 0200 FG V001 TEMPO 2507/2509 2000 DZ BR BKN003="
    
    let brakingList: [String] = [
        "NR",
        "5 : Good",
       "4 : Good - Medium",
       "3 : Medium",
       "2 : Medium - Poor",
       "1 : Poor"
    ]
    
    let coverageList: [String] = [
        "NR",
        "25%",
        "50%",
        "75%",
        "100%"
    ]
    
    let depthList: [String] = [
        "NR",
        "1 mm",
        "2 mm",
        "3 mm",
        "4 mm",
        "5 mm",
        "6 mm",
        "7 mm",
        "8 mm",
        "9 mm"
    ]
    
    let typeList: [String] = [
        "NR",
        "Wet",
        "Standing water",
        "Ice",
        "Frost",
        "Slush",
        "Wet snow",
        "Dry snow",
        "Compacted snow"
    ]
    
}
