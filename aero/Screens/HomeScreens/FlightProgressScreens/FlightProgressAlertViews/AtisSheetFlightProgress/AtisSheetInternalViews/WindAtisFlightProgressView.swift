//
//  WindAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct WindAtisFlightProgressView: View {
    
    @State private var isGustEnable : Bool = false;
    @State private var isBetweenEnable : Bool = false;
    @State private var isCalmEnable : Bool = false;
    
    @Binding var resultant : String
    @Binding var isReset : Bool ;
    
    @State private var selectedCalm : String?
    @State private var selectedVrb : String?
    @State private var selectedBetween : String?
    
    private let calm : String = "CALM";
    
    // DO NOT DELETE THIS
    /*  FOR UPDATE KT ELEMENT
             0 -> BetweenFirst
             1 -> BetweenSecond
             2 -> Selected1to9
             4 -> Selected10to50
     */
    @State private var updateKtElement : [String?] = Array(repeating: nil, count: 4)
    
    /*
     FOR UPDATE GUST ELEMENT
     0 -> Selected Gust
     1 -> Selected Gust 10 to 50
     2 -> Selected Gust 1 to 9
     */
    @State private var updateGustElement : [String?] = Array(repeating: nil, count: 3)
    
    
    /*
     FOR HSTACK ELEMENT
     
     [0] and [1] => For wind kt
     
     [2] and [3] => For first between
     
     [4] and [5] => For second between
     
     */
    @State private var hStackArray : [String?] = Array(repeating: nil, count: 6)
    
    @State var windKtResultant : String = ""
    @State var betweenFirstResultant : String = ""
    @State var betweenSecondResultant : String = ""
    
    @State private var updateKtSelection : String = ""
    @State private var updateGustSelection : String = ""
    @State private var updateBetweenSelection : String = ""
    
    let disable300List : [String] = ["300"]
    let disabledItemList : [String] = ["070","080","090"]
    @State private var disable300 : [String] = []
    @State private var disabledItems : [String] = []
    
    var body: some View {
        VStack(spacing: CustomPadding.defaultPadding - 2){
            CapitalizedTextHalfOpacity(text: "WIND [°]/[kt]", font: AppFonts.atisCapitalizedFont, isCapitalized: false)
            
            WindAtisFlightHstack(str100to300: $hStackArray[0], str1090: $hStackArray[1])
            
            windAtisFlightHstackView
            
            windAtisControls
            
            if(isGustEnable){
                gustEnableView
            }
            
            if(isBetweenEnable){
                betweenEnableView
            }
            
        }
        .frame(width: Dimensions.customSheetWidth)
        
        .onChange(of: updateKtElement) { updateWindKt() }
        .onChange(of: updateGustElement) { updateGust() }
        .onChange(of: selectedBetween) { updateBetween() }

        .onChange(of: updateKtSelection) { updateResultant() }
        .onChange(of: updateGustSelection) { updateResultant() }
        .onChange(of: updateBetweenSelection) { updateResultant() }

        .onChange(of: selectedVrb) { updateOnVrbChange() }

        .onChange(of: selectedCalm) { updateOnCalmChange() }
        .onChange(of: hStackArray){
            updateOnChangeOfHstack()
        }
        .onChange(of: isReset){
            resetToInitialState()
        }

    }
    
    private func updateOnChangeOfHstack() {
        func calculate(from index1: Int, and index2: Int) -> String {
            let value1 = Int(hStackArray[index1] ?? "0") ?? 0
            let value2 = Int(hStackArray[index2] ?? "0") ?? 0
            let sum = value1 + value2
            return sum == 0 ? "" : "\(sum)"
        }
        
        windKtResultant = calculate(from: 0, and: 1)
        updateWindKt()
        
        betweenFirstResultant = calculate(from: 2, and: 3)
        updateBetween()
        
        betweenSecondResultant = calculate(from: 4, and: 5)
        updateBetween()
    }
    
    private func updateOnCalmChange(){
        
        if(selectedCalm != nil){
            isCalmEnable = true
            resultant = calm
        }
        else{
            isCalmEnable = false
        }
        isGustEnable = false
        isBetweenEnable = false
        
        updateKtElement = Array(repeating: nil, count: 4)
        updateGustElement = Array(repeating: nil, count: 3)
        
        hStackArray = Array(repeating: nil, count: 6)
        selectedVrb = nil
        selectedBetween = nil
        
        windKtResultant = ""
        betweenFirstResultant = ""
        betweenSecondResultant = ""
        
        updateKtSelection = ""
        updateGustSelection = ""
        updateBetweenSelection = ""
        
        disable300 = []
        disabledItems = []
        
        updateWindKt()
        updateGust()
        updateBetween()
        updateResultant()
        
        
    }
    
    
    private func resetToInitialState() {
        isGustEnable = false
        isBetweenEnable = false
        isCalmEnable = false
        
        selectedCalm = nil
        selectedVrb = nil
        selectedBetween = nil
        
        updateKtElement = Array(repeating: nil, count: 4)
        updateGustElement = Array(repeating: nil, count: 3)
        
        hStackArray = Array(repeating: nil, count: 6)
        
        windKtResultant = ""
        betweenFirstResultant = ""
        betweenSecondResultant = ""
        
        updateKtSelection = ""
        updateGustSelection = ""
        updateBetweenSelection = ""
        resultant = ""
        disable300 = []
        disabledItems = []
    }
    
    
    private func updateOnVrbChange(){
        if(isBetweenEnable && selectedVrb == nil) {
            isBetweenEnable = false;
            selectedBetween = nil
            
        }
        updateWindKt()
    }
    private func updateBetween(){
        if isCalmEnable { return }
        
        var result = ""
            
            if selectedBetween != nil && (!betweenFirstResultant.isEmpty || !betweenSecondResultant.isEmpty) {
                result = "\(betweenFirstResultant.isEmpty ? "000" : betweenFirstResultant)V\(betweenSecondResultant.isEmpty ? "000" : betweenSecondResultant)"
            }

            if updateBetweenSelection != result {
                updateBetweenSelection = result
            }

            selectedVrb = isBetweenEnable ? "VRB" : nil

            updateWindKt()
    }
    
    private func updateWindKt(){
        
        if isCalmEnable { return }
        var result = ""
        if(!windKtResultant.isEmpty || updateKtElement[3] != nil || updateKtElement[2] != nil || !updateGustSelection.isEmpty){
            
            let num1 = Int(updateKtElement[2] ?? "")
            let num2 = Int(updateKtElement[3] ?? "")
            
            if(selectedVrb != nil && isBetweenEnable == false){
                result = "VRB\(String(format: "%02d", (num1 ?? 0) + (num2 ?? 0)))\(updateGustSelection)KT"
            }else{
                result = "\(windKtResultant.isEmpty ? "000" : windKtResultant)/\(String(format: "%02d", (num1 ?? 0) + (num2 ?? 0)))\(updateGustSelection)KT"
            }
        }
        
        updateKtSelection = result
    }
    
    private func updateGust(){
        if isCalmEnable { return }
        var result = ""
        if(updateGustElement[0] == nil){
            updateGustElement[1] = nil
            updateGustElement[2] = nil
        }
        else if(updateGustElement[1] != nil || updateGustElement[2] != nil){
           let num1 = Int(updateGustElement[1] ?? "")
            let num2 = Int(updateGustElement[2] ?? "")
            
            result = "G\((num1 ?? 0) + (num2 ?? 0))"
        }
        updateGustSelection = result
        updateWindKt()
    }
    
    private func updateResultant(){
        if(isCalmEnable){
            resultant = calm
            isCalmEnable = false
        }
        else{
            let texts = [updateKtSelection, updateBetweenSelection]
            
            resultant =  texts.filter { !$0.isEmpty }.joined(separator : " ")
        }
    }
    
    private var gustEnableView: some View {
        HStack {
            CustomGridText(data: ArrayTexts.number1050, isSpacer: false, selectedData: $updateGustElement[1])
            CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), selectedData: $updateGustElement[2])
        }
    }

    private var betweenEnableView: some View {
        VStack {
            WindAtisFlightHstack(str100to300: $hStackArray[2], str1090: $hStackArray[3])
            WindAtisFlightHstack(str100to300: $hStackArray[4], str1090: $hStackArray[5])
        }
    }

    private var windAtisFlightHstackView: some View {
        HStack {
            CustomGridText(data: ArrayTexts.number1050, isSpacer: false, selectedData: $updateKtElement[3])
            CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), selectedData: $updateKtElement[2])
        }
    }

    private var windAtisControls: some View {
        HStack {
            CustomGridText(data: ["Calm"], isSpacer: false, selectedData: $selectedCalm)
                .simultaneousGesture(TapGesture().onEnded {
                    if(resultant == calm){
                        isCalmEnable = false
                    }else{
                        isCalmEnable = true
                    }
                    updateOnCalmChange()
                })
            CustomGridText(data: ["+Gust"], isSpacer: false, selectedData: $updateGustElement[0])
                .simultaneousGesture(TapGesture().onEnded {
                    isGustEnable.toggle()
                })
            CustomGridText(data: ["VRB"], isSpacer: false, selectedData: $selectedVrb)
            CustomGridText(data: ["+between"], selectedData: $selectedBetween)
                .simultaneousGesture(TapGesture().onEnded {
                    isBetweenEnable.toggle()
                })
        }
    }
    
    
}

struct WindAtisFlightProgressView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper()
    }

    struct StatefulPreviewWrapper: View {
        @State private var resultant = ""

        var body: some View {
            WindAtisFlightProgressView(resultant: $resultant, isReset: .constant(false))
        }
    }
}







struct WindAtisFlightHstack : View {
    
    @Binding var str100to300 : String?
    @Binding var str1090 : String?
    
    let disable300List : [String] = ["300"]
    let disabledItemList : [String] = ["070","080","090"]
    
    @State private var disable300 : [String] = []
    @State private var disabledItems : [String] = []
    
    var body: some View {
        
        HStack{
            CustomGridText(data: ArrayTexts.number100to300, isSpacer: false, disabledItems: Set(disable300), selectedData: $str100to300)
            CustomGridText(data: ArrayTexts.number1090withZeroPrefix, disabledItems: Set(disabledItems), selectedData: $str1090)
        }
        .onChange(of: str100to300){ updateData() }
        .onChange(of: str1090){ updateData() }
    }
    private func updateData(){
        if(str100to300 != nil && disable300List.contains(str100to300!)){
            disabledItems = disabledItemList
        }else{
            disabledItems = []
        }
        
        if(str1090 != nil && disabledItemList.contains(str1090!)){
            disable300 = disable300List
        }
        else{
            disable300 = []
        }
    }
    
    
}
