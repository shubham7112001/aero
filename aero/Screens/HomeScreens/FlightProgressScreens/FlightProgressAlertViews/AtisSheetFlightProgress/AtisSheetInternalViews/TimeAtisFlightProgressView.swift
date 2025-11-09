//
//  TimeAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct TimeAtisFlightProgressView: View {
    @Binding var resultant : String
    @Binding var isReset : Bool
    
    @State private var selected1020 : String?
    @State private var selected1to9RightColon : String?
    @State private var selected1050 : String?
    @State private var selected1to9LeftColon : String?
    
    var disabledItems = ["04:", "05:", "06:", "07:", "08:", "09:"]
    @State var hourDisabledItems1to9 : [String] = []
    @State var hourDisabledItems1020 : [String] = []
    
    var body: some View {
        VStack(spacing: CustomPadding.defaultPadding - 2){
            CapitalizedTextHalfOpacity(text: "TIME [hh:mm]", font: AppFonts.atisCapitalizedFont, isCapitalized: false)
            HStack(spacing:0){
                CustomGridText(data: ArrayTexts.time1020, isSpacer: false,
                               disabledItems: Set(hourDisabledItems1020),selectedData: $selected1020)
                CustomGridText(data: ArrayTexts.time0109RightColon, disabledItems: Set(hourDisabledItems1to9), selectedData: $selected1to9RightColon)
            }
            HStack{
                CustomGridText(data: ArrayTexts.time1050, isSpacer: false, selectedData: $selected1050)
                CustomGridText(data: ArrayTexts.time0109LeftColon, selectedData: $selected1to9LeftColon)
            }
        }
        .frame(width: Dimensions.customSheetWidth)
        .onChange(of: selected1020){
            if(selected1020 == "20:"){
                hourDisabledItems1to9 = disabledItems
            }else {
                hourDisabledItems1to9 = []
            }
            
            updateResultant()

        }
        .onChange(of: selected1to9RightColon){
            if(selected1to9RightColon != nil && disabledItems.contains(selected1to9RightColon!)){
                hourDisabledItems1020 = ["20:"]
            }else{
                hourDisabledItems1020 = []
            }
            
            updateResultant()
        }
        .onChange(of: selected1050){
            
            updateResultant()
        }
        .onChange(of: selected1to9LeftColon){
            
            updateResultant()
        }
        .onChange(of: isReset){
            onReset()
        }
    }
    
    private func onReset(){
         selected1020 = nil
         selected1to9RightColon = nil
         selected1050 = nil
         selected1to9LeftColon = nil
        
        hourDisabledItems1to9  = []
        hourDisabledItems1020  = []
    }
    
    func updateResultant(){
        let hours : String = addStrings(str1: selected1020, str2: selected1to9RightColon, dropFirst: false)
        let minutes : String = addStrings(str1: selected1050, str2: selected1to9LeftColon, dropFirst: true)
        
        if(hours == "00" && minutes == "00"){
            resultant = ""
        }
        else{
            resultant = "\(hours):\(minutes)"
        }
    }
    
    
    func addStrings(str1: String?, str2: String?, dropFirst: Bool) -> String {
        
            var num1 = 0
            var num2 = 0
            
            if let validStr1 = str1 {
                let str1Processed = dropFirst ? String(validStr1.dropFirst()) : String(validStr1.dropLast())
                num1 = Int(str1Processed) ?? 0
            }
            
            if let validStr2 = str2 {
                let str2Processed = dropFirst ? String(validStr2.dropFirst()) : String(validStr2.dropLast())
                num2 = Int(str2Processed) ?? 0
            }
        
        
        let sum = num1 + num2
        print(sum)
        return String(format: "%02d", sum)
    }


}

#Preview {
    TimeAtisFlightProgressView(resultant: .constant(""), isReset:  .constant(false))
}
