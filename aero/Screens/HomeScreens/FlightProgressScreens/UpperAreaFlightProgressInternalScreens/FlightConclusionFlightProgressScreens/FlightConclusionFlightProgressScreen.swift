//
//  EndSheetUpperAreaFlightProgress.swift
//  taillog
//
//  Created by Shubham Tiwari on 06/12/24.
//

import SwiftUI

struct FlightConclusionFlightProgressScreen: View {
    @State var drawing : [Line] = []
    @State var isRemoveDrawing : Bool = false
    
    @EnvironmentObject var routes : FlightConclusionViewModel
    @State var showSaveAlert : Bool = false
    
    @Binding var showSheet : Bool
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack(spacing: Dimensions.spaceBwItems){
                SheetHeadingView(heading: "Flight conclusion",cancelText: "Save", functionText: "Save & e-mail",function:{
                }, cancelFunction: {
                    if(drawing.isEmpty){
                        showSaveAlert = true
                        return
                    }
                    if(!showSheet){
                        showSheet = true;
                    }
                    showSheet = false
                })
                
                VStack{
                    Text("NT959(NAY959) : GCFV-GCXO : DOF 05 DEC 2024")
                        .font(AppFonts.defaultText)
                    HStack{
                        textWithValue("OFF", "09:08 Z -")
                        textWithValue("ON", "09:10 Z:")
                        textWithValue("BLK", "00:02")
                    }
                    
                    HStack{
                        textWithValue("AIRB", "09:08 Z -")
                        textWithValue("LAND", "09:10 Z:")
                        textWithValue("FLT", "00:02")
                    }
                }
                
                DividerWithActionsVstack(actions: [
                    TextTextIconHStack(leftText: "Checklists", rightText: "NOT OK")
                        .wrapInButton {
                            routes.currentRoutes = .checklists
                        }
                        .toAnyView()
                    ,
                    TextTextIconHStack(leftText: "Delay codes", rightText: "")
                        .wrapInButton {
                            routes.currentRoutes = .delayCodes
                        }
                        .toAnyView()
                ])
                
                DividerWithActionsVstack(actions: [
                    TextTextIconHStack(leftText: "Fuel", rightText: "Ramp 3644lb")
                        .wrapInButton {
                            routes.currentRoutes = .fuel
                        }
                        .toAnyView(),
                    TextTextIconHStack(leftText: "Altimeter", rightText: "")
                        .wrapInButton {
                            routes.currentRoutes = .altimeterRvsm
                        }
                        .toAnyView()
                ])
                
                ImageSelectionStaticRow(text: "General remarks & photos",addedText: "", isImagePresent: true)
                    .wrapInButton {
                        routes.currentRoutes = .generalRemarks
                    }
                
                DrawingHeadingScreen(headingText: "PIC SIGNATURE: ALBERTO ROLDAN BENI / 17 JUL 2024", height: Dimensions.customSheetHeight * 0.3, lines: $drawing, isRemove: $isRemoveDrawing)
                Spacer()
            }
        }
        .alert(isPresented: $showSaveAlert, content: {
            Alert(title: Text("Missing signature"), message: Text("Please sign to save the fligtht log."),  dismissButton: .default(Text("OK")))
        })
        
        
        .frame(width: Dimensions.customSheetWidth, height: Dimensions.customSheetHeight)
    }
    
    private func textWithValue(_ boldText: String, _ normalText: String) -> some View{
        return HStack{
            Text(boldText)
                .font(AppFonts.defaultText)
                .fontWeight(.bold)
            Text(normalText)
                .font(AppFonts.defaultText)
        }
    }
}

#Preview {
    FlightConclusionFlightProgressScreen(showSheet: .constant(false))
}
