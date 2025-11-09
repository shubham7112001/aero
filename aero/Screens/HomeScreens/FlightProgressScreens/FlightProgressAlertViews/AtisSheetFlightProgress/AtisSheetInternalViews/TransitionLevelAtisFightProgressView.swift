//
//  TransitionLevelAtisFightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct TransitionLevelAtisFightProgressView: View {
    @Binding var resultant : String
    @Binding var isReset : Bool
    
    @State private var selected100 : String?
    @State private var selected1090 : String?
    @State private var selected5 : String?
    
    var body: some View {
        VStack(spacing: CustomPadding.defaultPadding - 2){
            CapitalizedTextHalfOpacity(text: "TRANSITION LEVEL [h ft]", font: AppFonts.atisCapitalizedFont, isCapitalized: false)
            
            HStack{
                CustomGridText(data: ["100"], isSpacer: false, selectedData: $selected100)
                CustomGridText(data: ArrayTexts.number1090, selectedData: $selected1090)
                CustomGridText(data: ["5"], selectedData: $selected5)
            }
        }
        .frame(width: Dimensions.customSheetWidth)
        .onChange(of: selected100){ updateResultant()}
        .onChange(of: selected1090){ updateResultant()}
        .onChange(of: selected5){ updateResultant()}
        .onChange(of: isReset){ onReset()}
    }
    
    private func onReset(){
        selected100 = nil
        selected1090 = nil
        selected5 = nil
    }
    
    private func updateResultant(){
        
        let num1 = Int(selected5 ?? "")
        let num2 = Int(selected1090 ?? "")
        let num3 = Int(selected100 ?? "")
        
        if(selected5 != nil || selected100 != nil || selected1090 != nil){
            resultant = "TL\((num1 ?? 0) + (num2 ?? 0) + (num3 ?? 0))"
        }
        else{
            resultant = ""
        }
    }
}

#Preview {
    TransitionLevelAtisFightProgressView(resultant: .constant(""), isReset: .constant(false))
}
