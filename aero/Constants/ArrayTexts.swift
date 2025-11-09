//
//  ArrayTexts.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/08/24.
//

import SwiftUI

class ArrayTexts {
    static let discretioneryReasons = ["Low altitude", "Route conditions", "Icy conditions", "Weather", "ATC delay", "Tankering", "Destination holding", "Ballast", "Over-fuelled"]
    
    //System Parameters
    static let minimunOnGroundTime = ["10 sec", "20 sec", "30 sec", "40 sec", "50 sec", "60 sec"];
    static let minimunOnBlockTime = ["2 min", "4 min", "6 min", "8 min", "10 min", "12 min", "14 min"]
    static let waypointDistaceSensitivity = ["1 NM", "2 NM", "3 NM", "4 NM", "5 NM", "6 NM", "7 NM", "8 NM", "9 NM", "10 NM"]
    static let normalRetoDelay = ["5%", "10%", "15%", "20%"]
    static let maximumRetoDelay = ["2 min", "3 min", "5 min", "10 min"]
    static let additionalDelayTime = ["2 min", "3 min", "5 min", "8 min", "10 min", "12 min"]
    
    // Ribbon Information Data Field
    static let rvsmDataField = ["ALT SEL", "PRI1", "PRI2", "SBY ALT", "Departure RVR", "Departure ceiling", "Arrival RVR", "Arrival ceiling", "ALT1 RVR", "ALT1 ceiling", "ALT2 RVR", "ALT2 ceiling", "ERA RVR", "ERA ceiling", "TOALT RVR", "TOALT ceiling"];
    static let takeOffDataField = ["Take-off wind direction", "Take-off wind speed", "Take-off gust", "Take-off temperature", "Take-off dewpoint", "Take-off QNH", "Take-off RPM", "Take-off Pitch/Path", "V1", "Vr", "V2", "Vfr", "Vft", "Vref EMG"];
    static let landingDataField = ["Landing wind direction", "Landing wind speed", "Landing gust", "Landing temperature", "Landing dewpoint", "Landing QNH", "Vref", "Vapp"];
    static let fuelDataField = ["Contingency fuel weight", "Contingency fuel volume", "ALT1 fuel weight", "ALT1 fuel volume", "ALT2 fuel weight", "ALT2 fuel volume", "Company fuel weight", "Company fuel volume", "Taxi fuel weight", "Taxi fuel volume", "Extra fuel weight", "Extra fuel volume", "Auxiliary fuel weight", "Auxiliary fuel volume", "Ramp fuel (Actual) weight", "Ramp fuel (Actual) volume", "Take-off fuel weight", "Take-off fuel volume", "On-block fuel weight", "On-block fuel volume"]
    
    // Reporting Retention Screen
    static let downloadedFlightPlansDayWise = ["1 day after STD", "2 days after STD", "3 days after STD", "5 days after STD"]
    static let completedFlightLogsDayWise = ["10 days", "20 days", "30 days", "90 days"]

    
    static let val1000to6000 = ["1000", "2000", "3000", "4000", "5000", "6000"]
    static let valUDN = ["U","D","N"]
    
    static let val100to900 = ["100", "200", "300", "400", "500", "600", "700", "800", "900"]
    
    static let a2m = (65...77).map { String(UnicodeScalar($0)!) }
    static let n2z = (78...90).map { String(UnicodeScalar($0)!) }
    
    static let time1020 = ["10:","20:"]
    static let time0109RightColon = ["01:", "02:", "03:", "04:", "05:", "06:", "07:", "08:", "09:"]
    
    static let time1050 = [":10", ":20", ":30", ":40", ":50"]
    static let time0109LeftColon = [":01", ":02", ":03", ":04", ":05", ":06", ":07", ":08", ":09"]
    
    static let procedureLeft = ["IFR","ILS","RNAV","VOR","VIS","LOC","DME"]
    static let procedureCenter = ["RH"]
    static let procedureRight = ["LVP","LVTO"]
    static let number1090 = ["10", "20", "30", "40", "50", "60", "70", "80", "90"]
    static let number1050 = ["10", "20", "30", "40", "50"]
    static let number1090withZeroPrefix = ["010", "020", "030", "040", "050", "060", "070", "080", "090"]

    
    static let number100to300 = ["100","200","300"]
    
    static let precipitationAndObsurationAtisList = ["DZ", "RA", "SN", "SG", "IC", "PL", "GR", "FG", "FU", "VA", "DU", "HZ"]
    static let precipitationAndObsurationAtisSubList = ["MI","BC","PR","BL","SH","TS","FZ"]
    static let cloudsAtisCavokList = ["CAVOK","SKC","NSC","NCD"]
    static let cloudsAtisFewList = ["FEW", "SCT", "BKN", "OVC"]
    
    
    
    
    
    
    
    
    
    
    
    
    static func listOfNumbers(start: Int, end: Int, difference: Int, prefix: String? = nil, suffix: String? = nil) -> [String] {
            return stride(from: start, through: end, by: difference).map {
                let numberString = String($0)
                let prefixed = prefix != nil ? "\(prefix!)\(numberString)" : numberString
                return suffix != nil ? "\(prefixed)\(suffix!)" : prefixed
            }
        }
}
