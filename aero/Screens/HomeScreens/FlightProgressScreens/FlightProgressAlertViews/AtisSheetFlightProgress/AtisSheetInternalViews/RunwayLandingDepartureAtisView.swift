//
//  RunwayLandingDepartureAtisScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct RunwayLandingDepartureAtisView: View {
    
    @Binding var resultant : String
    @Binding var isReset : Bool
    
    @State private var isRvr : Bool = false;
    @State private var isRcr : Bool = false;
    @State private var isVrb : Bool = false;
    
    @State private var selected1230First : String?
    @State private var selectedRvr : String?
    @State private var selected1230Second : String?
    @State private var selectedRcr : String?
    
    @State private var selectedMP : String?
    @State private var selected1000to6000Rvr : String?
    @State private var selected1000to6000Vrb : String?
    @State private var selectedUDN : String?
    @State private var selectedVrb : String?
    @State private var selected100to900Rvr: String?
    @State private var selected100to900Vrb: String?
    
    @State private var selected100 : String?
    @State private var selected1090 : String?
    @State private var selected5 : String?
    
    @State private var update1230Selection : String = ""
    @State private var updateRvrSelection : String = ""
    @State private var updateVrbSelection : String = ""
    @State private var updateRcrSelection :  String = ""
    @State private var updateClrWdSelection :  String = ""
    
    @State var matrix: [[String]] = Array(repeating: Array(repeating: "NR", count: 3), count: 4)
    let percentageMap: [String: String] = [
            "25%": "25",
            "50%": "50",
            "75%" : "75",
            "100%": "100"
        ]
    
    let rcrmap : [String : String] = [
        "WET" : "WET",
        "WTR" : "STANDING WATER",
        "ICE" : "ICE",
        "FRST" : "FROST",
        "SLU" : "SLUSH",
        "WSN" : "WET SNOW",
        "DSN" : "DRY SNOW",
        "CSN" : "COMPACTED SNOW"
    ]
    
    
    var body: some View {
        VStack(spacing: CustomPadding.defaultPadding - 2){
            
            CapitalizedTextHalfOpacity(text: "Runway landing / departure", font: AppFonts.atisCapitalizedFont)
            VStack{
                HStack{
                    CustomGridText(data: ["12","30"],isSpacer: false, selectedData: $selected1230First)
                    CustomGridText(data: ["+RVR"], selectedData: $selectedRvr)
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded{
                                    isRvr.toggle()
                                }
                        )
                }
                HStack{
                    CustomGridText(data: ["12","30"], isSpacer: false, selectedData: $selected1230Second)
                    
                    CustomGridText(data: ["+RCR"], selectedData: $selectedRcr)
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded{
                                    isRcr.toggle()
                                }
                        )
                }
                
                // RVR Screen
                if(isRvr){
                    VStack{
                        VStack{
                            HStack{
                                CustomGridText(data: ["M","P"], selectedData: $selectedMP)
                                    .frame(width: 100)
                                CustomGridText(data: ArrayTexts.val1000to6000, isSpacer: false, selectedData: $selected1000to6000Rvr)
                                CustomGridText(data: ArrayTexts.valUDN, isSpacer: false, selectedData: $selectedUDN)
                                Spacer()
                            }
                            
                            HStack{
                                CustomGridText(data: ["+VRB"], selectedData: $selectedVrb)
                                    .simultaneousGesture(
                                        TapGesture()
                                            .onEnded{
                                                isVrb.toggle()
                                            }
                                    )
                                    .frame(width: 100)
                                CustomGridText(data: ArrayTexts.val100to900, selectedData: $selected100to900Rvr)
                                
                            }
                        }
                        
                        if(isVrb){
                            VStack{
                                HStack{
                                    CustomWidthSpacer(width: 105)
                                    CustomGridText(data: ArrayTexts.val1000to6000, isSpacer: true, selectedData: $selected1000to6000Vrb)
                                }
                                HStack{
                                    CustomWidthSpacer(width: 105)
                                    CustomGridText(data: ArrayTexts.val100to900, selectedData: $selected100to900Vrb)
                                    
                                }
                                
                            }
                        }
                    }
                }
                
                // RCR SCREEN
                
                if(isRcr){
                    VStack{
                        HStack(spacing : 0){
                            AtisRcrView(matrix: $matrix, col: 0)
                            AtisRcrView(matrix: $matrix, col: 1)
                            AtisRcrView(matrix: $matrix, col: 2)
                        }
                        
                        HStack(spacing : 0){
                            Text("CLR\nWD").opacity(AppConstants.defaultOpacity)
                                .font(AppFonts.atisCapitalizedFont)
                            
                                .padding(CustomPadding.lPadding)
                            
                            CustomGridText(data: ["100"], isSpacer: false, selectedData: $selected100)
                            
                            CustomGridText(data: ArrayTexts.number1090, isSpacer: false, selectedData: $selected1090)
                            CustomGridText(data: ["5"], selectedData: $selected5)
                        }
                    }
                }
            }
        }
        .frame(width: Dimensions.customSheetWidth)
        .background(.veryLightGrey)
        .onChange(of: selected1230First) {
            update1230()
            updateResultant()
        }
        .onChange(of: selected1230Second) {
            update1230()
            updateResultant()
        }
        .onChange(of: selected1000to6000Rvr) {
            updateRvr()
            updateResultant()
        }
        .onChange(of: selected100to900Rvr) {
            updateRvr()
            updateResultant()
        }
        .onChange(of: selectedMP) {
            updateRvr()
            updateResultant()
        }
        .onChange(of: selectedUDN) {
            updateRvr()
            updateResultant()
        }
        .onChange(of: selected1000to6000Vrb) {
            updateVrb()
            updateResultant()
        }
        .onChange(of: selected100to900Vrb) {
            updateVrb()
            updateResultant()
        }
        .onChange(of: selectedVrb) {
            updateOnVrbChange()
            updateResultant()
        }
        .onChange(of: matrix) {
            updateOnRcrChange()
            updateResultant()
        }
        .onChange(of: selected100) {
            updateClrWd()
            updateResultant()
        }
        .onChange(of: selected1090) {
            updateClrWd()
            updateResultant()
        }
        .onChange(of: selected5) {
            updateClrWd()
            updateResultant()
        }
        .onChange(of: isReset){
            onReset()
        }

    }
    
    private func onReset(){
        
         isRvr  = false;
         isRcr  = false;
         isVrb  = false;
        
         selected1230First  = nil
         selectedRvr  = nil
         selected1230Second  = nil
         selectedRcr  = nil
        
         selectedMP  = nil
         selected1000to6000Rvr  = nil
         selected1000to6000Vrb  = nil
         selectedUDN  = nil
         selectedVrb  = nil
         selected100to900Rvr = nil
         selected100to900Vrb = nil
        
         selected100  = nil
         selected1090  = nil
         selected5  = nil
        
         update1230Selection  = ""
         updateRvrSelection  = ""
         updateVrbSelection  = ""
         updateRcrSelection  = ""
         updateClrWdSelection  = ""
    }
    
    private func updateResultant(){
        resultant = ""
        let texts = [
            update1230Selection,
            updateRvrSelection,
            updateRcrSelection,
            updateClrWdSelection
        ]
        
        
        let trimmedTexts = texts.map { $0.trimmingCharacters(in: .whitespaces) }
        
        let starting = trimmedTexts[0...2].allSatisfy { $0.isEmpty }
        
        for text in trimmedTexts {
            if !text.isEmpty {
                resultant += (resultant.isEmpty ? "" : " ") + text
            }
        }
        
        if(starting) {
            if let clrWdSelection = trimmedTexts.last, !clrWdSelection.isEmpty {
                resultant += (resultant.isEmpty ? "" : " ") + clrWdSelection
            }
        }
    }
    
    private func updateClrWd(){
        let num1 = Int(selected100 ?? "")
        let num2 = Int(selected1090 ?? "")
        let num3 = Int(selected5 ?? "")
        
        if(selected5 != nil || selected1090 != nil || selected100 != nil){
            updateClrWdSelection = "RWY WIDTH \((num1 ?? 0) + (num2 ?? 0) + (num3 ?? 0)) FT"
        }
        else {
            updateClrWdSelection = ""
        }
    }
    
    private func checkFirstRow(){
        var isPresent : Bool = false;
        for element in matrix[0] {
            if element != "NR" {
                isPresent = true
            }
        }
        var result = ""
        if(isPresent){
            for (index, element) in matrix[0].enumerated(){
                result += element
                
                if index < matrix[0].count - 1 {
                    result += "/"
                }
            }
        }
        
        updateRcrSelection = result
    }
    
    private func checkRemainingRow(){
        var isPresent : Bool = false
        var result = ""
        for rowIndex in 1..<matrix.count {
            for (index, element) in matrix[rowIndex].enumerated() {
                if(rowIndex == 1 || element == "NR"){
                    result.append(element.replacingOccurrences(of: "%", with: ""))
                }
                else if(rowIndex == 2){
                    result.append(element)
                }
                else{
                    result.append(rcrmap[element]!)
                }
                if(index < 2){
                    result.append("/")
                }
                if(element != "NR"){
                    isPresent = true
                }
            }
            result += " "
        }
        
        if(isPresent){
            if(!updateRcrSelection.isEmpty){
                updateRcrSelection += " "
            }
            updateRcrSelection += result
        }
    }
    
    private func updateOnRcrChange(){
        checkFirstRow()
        checkRemainingRow()
    }
    
    private func updateOnVrbChange(){
        selected1000to6000Vrb = nil
        selected100to900Vrb = nil
        updateVrb()
    }
    
    private func update1230(){
        if(selected1230First != nil && selected1230Second != nil){
            update1230Selection = "RWY LD \(selected1230First!) DEP \(selected1230Second!)"
        }
        else if(selected1230First != nil){
            update1230Selection = "RWY \(selected1230First!)"
        }
        else if(selected1230Second != nil){
            update1230Selection = "RWY \(selected1230Second!)"
        }
        else{
            update1230Selection = ""
        }
    }
    
    private func updateRvr(){
        let num1 = Int(selected1000to6000Rvr ?? "")
        let num2 = Int(selected100to900Rvr ?? "")
            
            
        let sum = (num1 ?? 0) + (num2 ?? 0)
        
        var result = ""
        
        if let selectedMP = selectedMP {
            result += selectedMP
        }
    
        result += "\(String(format: "%04d", sum))"
        
        result += "\(updateVrbSelection)"
        if let selectedUDN = selectedUDN {
            result += "\(selectedUDN) "
        }
    
        result += "FT"
        
        if(selected1000to6000Rvr == nil && selected100to900Rvr == nil && selectedMP == nil && selectedUDN == nil){
            updateRvrSelection = ""
        }else{
            updateRvrSelection = result
        }
        
    }
    
    private func updateVrb(){
        let num1 = Int(selected1000to6000Vrb ?? "")
        let num2 = Int(selected100to900Vrb ?? "")
            
        if(selected1000to6000Vrb == nil && selected100to900Vrb == nil){
            updateVrbSelection = ""
        }
        else{
            updateVrbSelection = "v\(String(format: "%04d", (num1 ?? 0) + (num2 ?? 0)))"
        }
        updateRvr()
    }
}


#Preview {
    RunwayLandingDepartureAtisView(resultant: .constant(""), isReset:  .constant(false))
}

struct AtisRcrView : View{
    let list1to5 = ["1", "2", "3", "4", "5"]
    let percentage = ["25%", "50%", "75%", "100%"]
    let list6to9 = ["6", "7", "8", "9"]
    
    let wetList = ["WET","WTR","ICE","FRST"]
    let sluList = ["SLU","WSN","DSN","CSN"]
    
    
    @Binding var matrix: [[String]]
    let col : Int
    
    @State var resultant : String = ""
    
    @State var selected1to5 : String?
    @State var selectedPercentage : String?
    @State var selected1to9 : String?
    @State var selectedWet : String?
    
    var body : some View{VStack(alignment: .leading){
        CustomGridText(data: list1to5,isSpacer: false, isContain: true, selectedData: $selected1to5)
        CustomGridText(data: percentage, isSpacer: false,isContain: true, selectedData: $selectedPercentage)
        CustomGridText(data: list1to5,data2: list6to9,isContain: true, selectedData: $selected1to9)
        
        CustomGridText(data: wetList,data2: sluList, isSpacer: true, isContain: true, selectedData: $selectedWet)
        }
    .frame(width: Dimensions.customSheetWidth / 3)
        .onChange(of: selected1to5){ onChangeOf1to5()}
        .onChange(of: selectedPercentage){ onChangeOfPercentage()}
        .onChange(of: selected1to9){onChangeOf1to9() }
        .onChange(of: selectedWet){ onChangeOfWet()}
        
    }
    
    private func onChangeOf1to5(){
        matrix[0][col] = selected1to5 ?? "NR"
    }
    
    private func onChangeOfPercentage(){
        matrix[1][col] = selectedPercentage ?? "NR"
    }
    
    private func onChangeOf1to9(){
        matrix[2][col] = selected1to9 ?? "NR"
    }
    
    private func onChangeOfWet(){
        matrix[3][col] = selectedWet ?? "NR"
    }
}
