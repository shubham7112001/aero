//
//  TemperatureDewpointAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct TemperatureDewpointAtisFlightProgressView: View {
    @Binding var resultant : String
    @Binding var isReset : Bool
    
    /*
    Index 0: selectedFirstM
    Index 1: selectedFirst1040
    Index 2: selectedFirst1to9
    Index 3: selectedSecondM
    Index 4: selectedSecond1040
    Index 5: selectedSecond1to9
    */
    @State private var selections: [String?] = Array(repeating: nil, count: 6)
    
    var body: some View {
        VStack{
            CapitalizedTextHalfOpacity(text: "temperature / dewpoint [°C]", font: AppFonts.atisCapitalizedFont)
            HStack{
                VStack{
                    CustomGridText(data: ["M"], isSpacer: false, selectedData: $selections[0])
                    CustomGridText(data: ["M"], isSpacer: false, selectedData: $selections[3])
                }
                VStack{
                    CustomGridText(data: ArrayTexts.listOfNumbers(start: 10, end: 40, difference: 10), isSpacer: false, selectedData: $selections[1])
                    CustomGridText(data: ArrayTexts.listOfNumbers(start: 10, end: 40, difference: 10), isSpacer: false, selectedData: $selections[4])
                }
                VStack{
                    CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), selectedData: $selections[2])
                    CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), selectedData: $selections[5])
                }
                Spacer()
            }
        }
        .frame(width: Dimensions.customSheetWidth)
        .onChange(of: selections){ updateResultant()}
        .onChange(of: isReset){ resetToInitialState()}
    }
    
    private func resetToInitialState() {
        selections = Array(repeating: nil, count: 6)
    }
        
    
    private func updateResultant(){
        if selections.allSatisfy({ $0 == nil }) {
            resultant = ""
            return
        }
        
        let first = (Int(selections[1] ?? "") ?? 0) + (Int(selections[2] ?? "") ?? 0)
        let second = (Int(selections[4] ?? "") ?? 0) + (Int(selections[5] ?? "") ?? 0)
        
        
        let firstResult = first == 0 ? "0" : "\(selections[0] ?? "")\(first)"
        let secondResult = second == 0 ? "0" : "\(selections[3] ?? "")\(second)"
        resultant = "\(firstResult)/\(secondResult)"
    }
}

#Preview {
    TemperatureDewpointAtisFlightProgressView(resultant: .constant(""), isReset: .constant(false))
}
