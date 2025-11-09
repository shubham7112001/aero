//
//  ReroutingSheetFlightProgressViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 11/12/24.
//

import Foundation

class ReroutingSheetFlightProgressViewModel: ObservableObject {
    @Published var selectedSegment: Int = 0
    @Published var input: String = ""
    @Published var showLatPopup: Bool = false
    @Published var showLonPopup: Bool = false
    @Published var resultant: String = ""
    @Published var latLonList: [String] = []
    @Published var prevLatString: String = ""
    @Published var prevLonString: String = ""
    @Published var latModel: LatLonModel = LatLonModel(direction: "N", degree: 0, minute: 0, second: 0)
    @Published var lonModel: LatLonModel = LatLonModel(direction: "E", degree: 0, minute: 0, second: 0)
    @Published var icaoIdxList: [Int] = []
    @Published var icaoText: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var activateAlert: Bool = false

    let waypointAlertMessage = "The waypoint coordinate cannot be identical to the previous waypoint."
    let icaoEmptyAlertMessage = "Please enter a valid airport ICAO."
    
    let activateAlertMessage = "The original flight plan will be modified. Do you want to activate the rerouting?"
    
    func showActivateAlert(){
        activateAlert = true
    }

    func onAddOnIcao() {
        guard !icaoText.isEmpty && icaoText.count == 4 else {
            alertMessage = icaoEmptyAlertMessage
            showAlert = true
            return
        }

        if prevLatString == icaoText {
            alertMessage = waypointAlertMessage
            showAlert = true
            return
        }

        updateWithPrefix(icaoText)
        updateResultant()

        updatePrevValues()
        icaoText = ""
    }

    func insertInLatLonList() {
        let latValue = "\(latModel.direction)\(String(format: "%02d", latModel.degree)):\(latModel.minute).\(latModel.second)"
        let lonValue = "\(lonModel.direction)\(String(format: "%03d", lonModel.degree)):\(lonModel.minute).\(lonModel.second)"
        let res = "\(latValue) \(lonValue)"

        guard !(prevLatString == latValue && prevLonString == lonValue) else {
            alertMessage = waypointAlertMessage
            showAlert = true
            return
        }

        prevLatString = latValue
        prevLonString = lonValue

        if selectedSegment == 1 { // For Airports
            updateWithPrefix(res)
        } else { // For Waypoints
            latLonList.append(res)
        }
        print(latLonList)
        updateResultant()
    }

    func removeLastLatLonList() {
        if let lastIndex = icaoIdxList.last, latLonList.count - 1 == lastIndex {
            icaoIdxList.removeLast()
        }
        
        if !latLonList.isEmpty {
            latLonList.removeLast()
            updatePrevValues()
        }

        if latLonList.isEmpty {
            icaoIdxList.removeAll()
        }
        updateResultant()
        
        selectedSegment = 0
    }

    private func updateWithPrefix(_ res: String) {
        let prefix: String
        switch icaoIdxList.count {
        case 0: prefix = ""
        case 1: prefix = "ALT1 "
        case 2: prefix = "ALT2 "
        default: prefix = ""
        }

        icaoIdxList.append(latLonList.count)
        latLonList.append(prefix + res)
        print(latLonList)
    }
    
    private func updatePrevValues(){
        if(!latLonList.isEmpty){
            let last = latLonList.last
            
            let words : [String]  = last!.split(separator: " ").map { String($0) }
            
            if(words.count == 1){
                prevLatString = words[0]
                prevLonString = words[0]
            }
            else if(words.count == 2){
                if(words[0] == "ALT1" || words[0] == "ALT2"){
                    prevLatString = words[1]
                }
                else{
                    prevLatString = words[0]
                }
                
                prevLonString = words[1]
            }
            else if(words.count == 3){
                prevLatString = words[1]
                prevLatString = words[2]
            }
        }else{
            prevLatString = ""
            prevLonString = ""
        }
    }

    private func updateResultant() {
        resultant = latLonList.joined(separator: " ")
    }
    }
