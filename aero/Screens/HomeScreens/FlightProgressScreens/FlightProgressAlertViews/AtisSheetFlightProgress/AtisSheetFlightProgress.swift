//
//  AtisSheetFlightProgress.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/09/24.
//

import SwiftUI

struct AtisSheetFlightProgress: View {
    @Binding var showAtisSheet : Bool
    @State var resultant : String = "";
    
    @Binding var atisTexts: [String] // = Array(repeating: "", count: 12)
    
    @State var isReset : Bool = false
    @State private var showResetAlert : Bool = false
    @State var isEU : Bool = true
    
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack{
                
                SheetHeadingView(heading: "Departure ATIS notes",cancelText: "Close", functionText: "Reset",function:{
                    showResetAlert = true
                }, cancelFunction: {
                    if(!showAtisSheet){
                        showAtisSheet = true
                    }
                    showAtisSheet = false
                })
                
                sectionSpacing()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(resultant)
                            .padding(CustomPadding.vPadding)
                    }
                    .frame(maxWidth: .infinity, alignment: .topLeading)
//                    .padding(CustomPadding.vPadding)
                }
                .padding(CustomPadding.hPadding)
                .frame(minHeight: 80, maxHeight: 80)
                .background(Color.dWhite)
                
                
                HStack(spacing : 0){
                    Text("NOTE: The weather data of section Take-off will be updated")
                        .foregroundStyle(.mainBlue)
                        .font(AppFonts.smallText)
                    Spacer()
                    VStack{
                        roundedText(text: "EU", isSelected: isEU)
                    }
                        .onTapGesture {
                            isEU = true
                        }
                    VStack{
                        roundedText(text: "US", isSelected: !isEU)
                    }
                        .onTapGesture{
                            isEU = false
                        }
                    
                }
                .padding(.horizontal, CustomPadding.defaultPadding )
                
                
                ScrollView{
                    
                    VStack(spacing: Dimensions.spaceBwItems){
                        
                        InformationIdAtisFlightProgressView(resultant: $atisTexts[0], isReset : $isReset)
                        
                        TimeAtisFlightProgressView(resultant: $atisTexts[1], isReset : $isReset)
                        
                        ProcedureAtisFlightProgressView(resultant: $atisTexts[2], isReset : $isReset)
                        
                        RunwayLandingDepartureAtisView(resultant: $atisTexts[3], isReset : $isReset)
                        
                        TransitionLevelAtisFightProgressView(resultant: $atisTexts[4], isReset : $isReset)
                        
                        WindAtisFlightProgressView(resultant: $atisTexts[5], isReset : $isReset)
                        
                        VisibilityAtisFlightProgressView(resultant: $atisTexts[6], isEU : $isEU, isReset : $isReset)
                        
                        PrecipitationAndObsurationAtisFlightProgressView(isReset : $isReset, resultant: $atisTexts[7])
                        
                        CloudsAtisFlightProgressView(resultant: $atisTexts[8], isReset : $isReset)
                        
                        TemperatureDewpointAtisFlightProgressView(resultant: $atisTexts[9], isReset : $isReset)
                        
                        AltimeterQnhAtisFlightProgressView(resultant: $atisTexts[10], isEU : $isEU, isReset : $isReset)
                        
                        AddFieldAtisFlightProgressView(resultant:$atisTexts[11], isReset : $isReset)
                        
                        
                        CustomHeightSpacer(height: 200)
                    }
                    .padding(.leading, -16)
                }
                Spacer()
                
            }
            .frame(width: Dimensions.customSheetWidth, height: Dimensions.customSheetHeight)
        }
        .ignoresSafeArea()
        .alert("Reset ATIS",isPresented: $showResetAlert) {
            Button("Cancel"){}
            Button("Reset"){
                atisTexts = Array(repeating: "", count: 12)
                isReset.toggle()
                updateResultant()}
        }message: {
            Text("Do you want to reset the ATIS notes?")
        }
        .onChange(of: atisTexts){ updateResultant() }
        .onAppear { updateResultant() }
    }
    
    
    
    private func updateResultant() {
        DispatchQueue.main.async(){
            resultant = atisTexts.filter { !$0.isEmpty }.joined(separator: " ")
        }
    }
    private func roundedText(text : String, isSelected : Bool) -> some View{
        return Text(text)
            .font(AppFonts.smallText)
            .foregroundStyle(isSelected ? .dWhite : .gray)
            .padding(.horizontal, CustomPadding.horizontal)
            .padding(.vertical, CustomPadding.vertical / 2)
            .background( isSelected ? .main : .veryLightGrey)
            .roundedCorner(4, corners: [.bottomLeft, .bottomRight])
    }
}

#Preview {
    AtisSheetFlightProgress(showAtisSheet: .constant(true), atisTexts: .constant([]))
}
