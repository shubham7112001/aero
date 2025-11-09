//
//  ProcedureAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct ProcedureAtisFlightProgressView: View {
    @Binding var resultant : String
    @Binding var isReset : Bool
    
    @State private var selectedProcedureLeft : String?
    @State private var selectedProcedureCenter : String?
    @State private var selectedProcedureRight : String?
    
    var body: some View {
        VStack(spacing: CustomPadding.defaultPadding - 2){
            CapitalizedTextHalfOpacity(text: "procedure", font: AppFonts.atisCapitalizedFont)
        HStack(spacing:0){
            CustomGridText(data: ArrayTexts.procedureLeft,isSpacer: false, isMultipleSelection : true, selectedData: $selectedProcedureLeft)
            CustomGridText(data: ArrayTexts.procedureCenter, isSpacer: false, selectedData: $selectedProcedureCenter)
            CustomGridText(data: ArrayTexts.procedureRight, isSpacer: false, selectedData: $selectedProcedureRight)
                Spacer()
            }
        }
        .frame(width: Dimensions.customSheetWidth)
        .onChange(of: selectedProcedureLeft){updateResultant()}
        .onChange(of: selectedProcedureCenter){updateResultant()}
        .onChange(of: selectedProcedureRight){updateResultant()}
        .onChange(of: isReset){onReset()}
        
    }
    private func onReset(){
        selectedProcedureLeft = nil
        selectedProcedureCenter = nil
        selectedProcedureRight = nil
    }
    func updateResultant(){
        let texts = [
            selectedProcedureLeft,
            selectedProcedureCenter,
            selectedProcedureRight
        ]
        
        resultant = texts.compactMap { $0 }.filter { !$0.isEmpty }.joined(separator: " ")
    }
}

#Preview {
    ProcedureAtisFlightProgressView(resultant: .constant(""), isReset: .constant(false))
}
