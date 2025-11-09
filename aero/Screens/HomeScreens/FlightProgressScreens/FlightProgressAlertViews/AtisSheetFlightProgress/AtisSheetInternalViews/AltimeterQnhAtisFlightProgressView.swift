//
//  AltimeterAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct AltimeterQnhAtisFlightProgressView: View {
    
    @Binding var resultant : String
    @Binding var isEU : Bool
    @Binding var isReset : Bool
    
    @State var isResetCalled : Bool = false
    /*
    [0] selected27to31 : String?
    [1] selectedFirst1to9 : String?
    [2] selectedSecond1to9 : String?
    */
    
    @State private var selectionsAltimeter : [String?] = Array(repeating: nil, count: 3)
    @State private var selectionsQNH : [String?] = Array(repeating: nil, count: 3)
    
    var body: some View {
        VStack{
            CapitalizedTextHalfOpacity(text: "\(isEU ? "QNH [in hPa]" : "ALTIMETER [in Hg]")", font: AppFonts.atisCapitalizedFont, isCapitalized: false)
            
            HStack{
                VStack{
                    if(isEU){
                        CustomGridText(data: ["90", "100"], isSpacer: false, selectedData: $selectionsQNH[0])
                            
                    }else{
                        CustomGridText(data: ["27","28","29"], data2: ["30","31"], isSpacer: false, selectedData: $selectionsAltimeter[0])
                    }
                    Spacer()
                        
                }
                .frame(height : 60)
                
                if(isEU){
                    VStack{
                        CustomGridText(data: ArrayTexts.listOfNumbers(start: 10, end: 90, difference: 10), selectedData: $selectionsQNH[1])
                        CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), selectedData: $selectionsQNH[2])
                    }
                }else{
                    VStack{
                        CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), prefix: ".", selectedData: $selectionsAltimeter[1])
                        CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), prefix: ".0", selectedData: $selectionsAltimeter[2])
                    }
                }
            }
            
        }
        .frame(width: Dimensions.customSheetWidth)

        
        .onChange(of: isReset){
            isResetCalled = true
            resetToInitialState()
            
        }
        .onChange(of : selectionsAltimeter){
            updateResultant()
        }
        .onChange(of: selectionsQNH){
            updateResultant()
        }
        .onChange(of: isEU){
            updateResultant()
        }
    }
    
    private func resetToInitialState() {
        selectionsAltimeter = Array(repeating: nil, count: 3)
        selectionsQNH = Array(repeating: nil, count: 3)
        updateQnhResultant()
        updateAltimeterResultant()
    }
    
    
    private func updateResultant(){
        isEU ? updateQnhResultant() : updateAltimeterResultant()
    }
    
    private func updateAltimeterResultant(){
        if selectionsAltimeter.allSatisfy({$0 == nil}){
            resultant = ""
            return
        }
        
        resultant = "A\(selectionsAltimeter[0] ?? "0").\(selectionsAltimeter[1] ?? "0")\(selectionsAltimeter[2] ?? "0")"
    }
    
    private func updateQnhResultant(){
        if selectionsQNH.allSatisfy({$0 == nil}){
            resultant = ""
            return
        }
        
        resultant = "\(selectionsQNH.prefix(3).compactMap { Int($0 ?? "") }.reduce(0, +))"    }
}

#Preview {
    AltimeterQnhAtisFlightProgressView(resultant: .constant(""),isEU: .constant(true), isReset: .constant(false))
}
