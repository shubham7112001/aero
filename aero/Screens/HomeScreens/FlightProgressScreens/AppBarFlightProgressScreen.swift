//
//  AppBarFlightProgressScreen.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

enum ManualAutomaticFlightProgressAlertType{
    case automatic
    case manual
    case user
}

struct AppBarFlightProgressScreen: View {
    @Binding  var isOffset : Bool
    @StateObject var currentReroutes : ReroutingRoutesViewModel = ReroutingRoutesViewModel()
    let imgSize : CGFloat = 25
    @State  var alertType : FlightProgressAlertType = .man
    @State  var autoManAlertType : ManualAutomaticFlightProgressAlertType = .automatic
    @State var showAlert : Bool = false;
    @State var showAutoManAlert : Bool = false;
    
    @State var alertHeading : String = "Alert"
    @State var alertMessage : String = ""
    
    @State var showReroutingSheet : Bool = false;
    
    @State var autoManText: String = "MAN"
    var body: some View {
        HomeScreenAppBar(
            isOffset: $isOffset,
            titleText: AppTexts.flightProgress,
            actions: [
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        HStack(spacing : Dimensions.spaceBwItems / 2){
                            
                            roundedFlightProgressAppBarView(text: "RER", isDisabled: false, bgColor: .main)
                                .wrapInButton {
                                    showReroutingSheet = true;
                                }
                            
                            roundedFlightProgressAppBarView(text: autoManText, isDisabled: false, bgColor: .btn)
                                .wrapInButton {
                                    onManualImgTap()
                                }
                            
                            roundedFlightProgressAppBarView(text: "XFER", isDisabled: false, bgColor: .xfer)
                                .wrapInButton {
                                    onXferImgTap()
                                    
                                }
                        }
                        Spacer()
                        HStack{
                            AppBarText(text: "STD --:-- Z", font: AppFonts.largeText)
                            IconImage(content: .customImage(Image(.logo)),height: imgSize,width: imgSize)
                        }
                        
                        
                    }
                }
//                    .padding(.bottom, Dimensions.defaultPadding / 2)
                    
                    .toAnyView()
            ], isCenter: false)
        .frame(height: Dimensions.appBarHeight + 10)
        .alert(alertHeading, isPresented : $showAlert){
            switch alertType {
            case .man :
                Button("Automatic"){
                    onAutoOptionTap()
                }
                .disabled(autoManText == "AUTO")
                
                Button("Manual"){
                    onManualOptionTap()
                }
                .disabled(autoManText == "MAN")
                
                Button("User configured"){
                    onUserConfigureOptionTap()
                }
                .disabled(autoManText == "USER")
                
                Button("Cancel", role: .cancel) {}
                
            case .xfer:
                Button("Send"){}
                Button("Receive"){}
                Button("Cancel", role: .cancel) {}
                
            }
        }message:{
            Text(alertMessage)
        }
        .alert(alertHeading, isPresented : $showAutoManAlert){
            switch autoManAlertType {
                
            case .automatic:
                Button("Cancel", role: .cancel) {}
                Button("Auto mode") {
                    autoManText = "AUTO"
                }
                
            case .manual:
                Button("Cancel", role: .cancel) {}
                Button("Manual mode") {
                    autoManText = "MAN"
                }
                
            case .user:
                Button("Cancel", role: .cancel) {}
                Button("User mode") {
                    autoManText = "USER"
                }
                
            }
        }message:{
            Text(alertMessage)
        }
        .customFlexSheet(isPresented: $showReroutingSheet){
            MainReroutingSheetFlightProgress(showSheet: $showReroutingSheet)
                .environmentObject(currentReroutes)
        }
    }
    
    private func onManualImgTap(){
        alertHeading = "Flight progress mode"
        alertMessage = "Select execution mode for running the flight progress."
        alertType = .man
        showAlert = true;
    }
    
    private func onXferImgTap(){
        alertHeading = "Transfer flight log"
        alertMessage = "Select to send or receive the active flight log between the iPads."
        alertType = .xfer
        showAlert = true;
    }
    
    private func onAutoOptionTap(){
        alertHeading = "Confirm auto mode"
        alertMessage = "The flight progress will be changed to automatic mode. All progress registration will be done automatically."
        autoManAlertType = .automatic
        showAutoManAlert = true;
    }
    
    private func onManualOptionTap(){
        alertHeading = "Confirm manual mode"
        alertMessage = "The flight progress will be changed to manual mode. All progress registration must be done manually."
        autoManAlertType = .manual
        showAutoManAlert = true;
    }
    
    private func onUserConfigureOptionTap(){
        alertHeading = "Confirm user mode"
        alertMessage = "The flight progress will be changed to user configured mode. The progress registration must be done according to configuration."
        autoManAlertType = .user
        showAutoManAlert = true;
    }
    
    private func roundedFlightProgressAppBarView(text: String, isDisabled: Bool, bgColor : Color) -> some View {
        let imgWidth: CGFloat = 60
        let imgHeight: CGFloat = 25
        let cornerRadius: CGFloat = 5
        
        return ZStack {
            
            Rectangle()
                .fill(isDisabled ? .lightGrey : bgColor)
                .frame(width: imgWidth, height: imgHeight)
                .roundedCorner(cornerRadius, corners: [.topLeft, .topRight])
            
            Text(text)
                .font(AppFonts.verySmallText)
                .foregroundColor(.dWhite)
                .frame(width: imgWidth, height: imgHeight)
        }
        .disabled(isDisabled)
    }

}

#Preview {
    AppBarFlightProgressScreen(isOffset: .constant(false))
}
