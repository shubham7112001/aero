//
//  FlightProgressViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 18/12/24.
//

import Foundation
import SwiftUI

class FlightProgressViewModel: ObservableObject{
    @Published var alertManager = CustomAlertManager.shared
    @Published var dialogManager = CustomDialogManager.shared
    
    @Published var isOffset = false;
    @Published var xOffset = Dimensions.sidebarOffset;
    
    @Published var waypoints : [FlightWaypointsDB] = []
    
    
    
    // WAYPOINTS TABLE
    
    let toc = "-TOC-", tod = "-TOD-"
    @Published var registerFlightProgressImg1: UIImage = .directtoActive
    @Published var registerFlightProgressImg2: UIImage = .abeamActive
    @Published var registerFlightProgressImg3: UIImage = .fuelActive

    @Published var registerFlightProgressImgTxt1: String = "Direct-to"
    @Published var registerFlightProgressImgTxt2: String = "Abeam time"
    @Published var registerFlightProgressImgTxt3: String = "Fuel level"

    @Published var registerFlightProgressImg1Action: () -> Void = {}
    @Published var registerFlightProgressImg2Action: () -> Void = {}
    @Published var registerFlightProgressImg3Action: () -> Void = {}

    @Published var registerFlightProgressSelectedText: String = "ASDF ASDF"

    @Published var registerFlightProgressSelectedIdx: Int = 0
    @Published var registerFlightProgressCurrIdx: Int = 0

    @Published var registerFlightProgressLongText: String = "Select and register direct-to, actual time over or fuel level for waypoint:"
    @Published var registerFlightProgressRemarksInput: String = ""
    @Published var registerFlightProgressIsScroll: Bool = false
    
    
    func registerFlightProgressDepartureTapFunction() {
        registerFlightProgressImg1 = .offblock
        registerFlightProgressImg2 = .airborneActive
        registerFlightProgressImg3 = .fuelActive
        
        registerFlightProgressImgTxt1 = "Off-block"
        registerFlightProgressImgTxt2 = "Airborne"
        registerFlightProgressImgTxt3 = "Take off"
        
        registerFlightProgressImg1Action = {
            self.showOffBlockAlert(centerText: self.registerFlightProgressSelectedText)
        }
        registerFlightProgressImg2Action = {
            self.showAirborneAlert(centerText: self.registerFlightProgressSelectedText)
        }
        registerFlightProgressImg3Action = {
            self.showTakeOffFuelAlert(centerText: self.registerFlightProgressSelectedText)
        }
    }

    func registerFlightProgressExceptDeptTapFunc() {
        if (registerFlightProgressSelectedText == toc ||
            registerFlightProgressSelectedText == tod ||
            registerFlightProgressSelectedIdx == registerFlightProgressCurrIdx) {
            registerFlightProgressImg1 = .directtoInactive
        } else {
            registerFlightProgressImg1 = .directtoActive
        }
        
        if (registerFlightProgressCurrIdx == 0 && registerFlightProgressSelectedIdx != 0) {
            registerFlightProgressImg2 = .abeamInactive
        } else {
            registerFlightProgressImg2 = .abeamActive
        }
        
        registerFlightProgressImg3 = .fuelActive
        
        registerFlightProgressImgTxt1 = "Direct-to"
        registerFlightProgressImgTxt2 = "Abeam time"
        registerFlightProgressImgTxt3 = "Fuel level"
        
        registerFlightProgressImg1Action = {
            self.registerFlightProgressSelectedIdx = self.registerFlightProgressCurrIdx
        }
        registerFlightProgressImg2Action = {
            self.showAbeamTimeAlert(centerText: self.registerFlightProgressSelectedText)
        }
        registerFlightProgressImg3Action = {
            self.showFuelAlert(centerText: self.registerFlightProgressSelectedText)
        }
    }
    
    func registerFlightProgressDestinationTapFunction() {
        
        registerFlightProgressImg1 = .landed
        registerFlightProgressImg2 = .onblock
        registerFlightProgressImg3 = .fuelActive
        
        registerFlightProgressImgTxt1 = "Landed"
        registerFlightProgressImgTxt2 = "On-block"
        registerFlightProgressImgTxt3 = "Engine off"
        
        registerFlightProgressImg1Action = {
            self.showLandedAlert(centerText: self.registerFlightProgressSelectedText)
        }
        registerFlightProgressImg2Action = {
            self.showOnBlockAlert(centerText: self.registerFlightProgressSelectedText)
        }
        registerFlightProgressImg3Action = {
            self.showEngineOffAlert(centerText: self.registerFlightProgressSelectedText)
        }
    }
    
    func registerFlightProgressOnTap(_ index: Int){
        registerFlightProgressCurrIdx = index
        registerFlightProgressSelectedText = StaticModelDataFlightProgressScreen.mockData[index].waypoint
        //
        if(registerFlightProgressCurrIdx == 0 && registerFlightProgressSelectedIdx == 0){
            registerFlightProgressDepartureTapFunction()
        }else if(index % 12 == 4 && registerFlightProgressSelectedIdx == registerFlightProgressCurrIdx){
            registerFlightProgressDestinationTapFunction()
        }else {
            registerFlightProgressExceptDeptTapFunc()
        }
        
        dialogManager.showDialog(view: RegisterFlightFlightProgressView(viewModel: self))
        
    }
    
    
    // ALERTS
    
    private func showOffBlockAlert(centerText: String = "", rightBtnAction: @escaping () -> Void = {}){
        alertManager.showAlert(view: CustomAlertDateSelection(
            headingStaticText: "Confirm off-block",
            centerTopText: "Confirm off-block and flight start.",
            centerBottomText: centerText,
            boldText: "OFF",
            rightBtnText: "Off-block",
            rightBtnAction: rightBtnAction
        ))
        
    }
    
    
    private func showAirborneAlert(centerText: String = "", rightBtnAction: @escaping () -> Void = {}){
        alertManager.showAlert(view: CustomAlertDateSelection(
            headingStaticText: "Confirm airborne",
            centerTopText: "Confirm airborne and flight take-off.",
            centerBottomText: centerText,
            boldText: "AIRB",
            rightBtnText: "Airborne",
            rightBtnAction: rightBtnAction
        ))
    }
    
    private func showTakeOffFuelAlert(centerText: String = "", rightBtnAction: @escaping () -> Void = {}){
        alertManager.showAlert(view: CustomAlertDateSelection(
            headingStaticText: "Enter take-off fuel level",
            centerTopText: "Enter indicated fuel level for take-off.",
            centerBottomText: centerText,
            boldText: "T/O fuel",
            rightBtnText: "Save",
            rightBtnAction: rightBtnAction,
            isTextField: true,
            textfieldSuffix: "lb"
        ))
    }
    
    private func showFuelAlert(centerText: String = "", rightBtnAction: @escaping () -> Void = {}){
        alertManager.showAlert(view: CustomAlertDateSelection(
            headingStaticText: "Enter fuel level",
            centerTopText: "Enter indicated fuel level for waypoint:",
            centerBottomText: centerText,
            boldText: "IND fuel",
            rightBtnText: "Save",
            rightBtnAction: rightBtnAction,
            isTextField: true,
            textfieldSuffix: "lb"
        ))
    }
    
    private func showAbeamTimeAlert(centerText: String = "", rightBtnAction: @escaping () -> Void = {}){
        alertManager.showAlert(view: CustomAlertDateSelection(
            headingStaticText: "Confirm ATO",
            centerTopText: "Confirm actual time over waypoint:",
            centerBottomText: centerText,
            boldText: "ATO",
            rightBtnText: "ATO",
            rightBtnAction: rightBtnAction
        ))
    }
    
    private func showLandedAlert(centerText: String = "", rightBtnAction: @escaping () -> Void = {}){
        alertManager.showAlert(view: CustomAlertDateSelection(
            headingStaticText: "Confirm landed",
            centerTopText: "Confirm landed and flight on-ground.",
            centerBottomText: centerText,
            boldText: "LAND",
            rightBtnText: "Landed",
            rightBtnAction: rightBtnAction
        ))
    }
    private func showOnBlockAlert(centerText: String = "", rightBtnAction: @escaping () -> Void = {}){
        alertManager.showAlert(view: CustomAlertDateSelection(
            headingStaticText: "Confirm on-block",
            centerTopText: "Confirm on-block and flight complete.",
            centerBottomText: centerText,
            boldText: "ON",
            rightBtnText: "On-block",
            rightBtnAction: rightBtnAction
        ))
    }
    private func showEngineOffAlert(centerText: String = "", rightBtnAction: @escaping () -> Void = {}){
        alertManager.showAlert(view: CustomAlertDateSelection(
            headingStaticText: "Enter on-block fuel level",
            centerTopText: "Enter indicated fuel level for on-block.",
            centerBottomText: centerText,
            boldText: "ON fuel",
            rightBtnText: "Save",
            rightBtnAction: rightBtnAction,
            isTextField: true,
            textfieldSuffix: "lb"
        ))
    }
    
}
