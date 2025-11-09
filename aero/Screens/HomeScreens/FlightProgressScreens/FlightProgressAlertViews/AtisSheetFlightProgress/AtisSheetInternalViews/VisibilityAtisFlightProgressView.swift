//
//  VisibilityAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct VisibilityAtisFlightProgressView: View {
    
    
    
    @Binding var resultant : String
    @Binding var isEU : Bool
    @Binding var isReset: Bool
    
//    @State var selectedValues: [String?] = [nil, nil, nil]
    @State var selectedValuesEU: [String?] = [nil, nil, nil]
    @State var selectedValuesUS: [String?] = [nil, nil, nil]
    @State var isNdvEnable : Bool = false
    @State var selectedNdv : String?
    /*
     // selectedNdv
     [0] selected10,
     [1] selectedFirst1to9,
     [2] selectedNDV,
     [3] selectedSecond1to9
     
     */
    
    @State private var isUpdating : Bool = false
    let ndv : String = "NDV"
    
    var body: some View {
        VStack(alignment : .leading, spacing: Dimensions.defaultPadding - 2){
            CapitalizedTextHalfOpacity(text: "visibility [\(isEU ? "K" : "S")m]",font: AppFonts.atisCapitalizedFont)
                        
            HStack{
                VStack(alignment : .leading, spacing : 0){
                    CustomGridText(data: isEU ? ["10", "20"] : ["10"], isSpacer: false,selectedData: isEU ? $selectedValuesEU[0] : $selectedValuesUS[0])
                        .padding(CustomPadding.tHalfPadding)
                        .simultaneousGesture(TapGesture().onEnded {
                            DispatchQueue.main.async {
                                updateOnTap()
                            }
                        })
                    Spacer()
                }
                
                VStack{
                    CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), isSpacer: false, selectedData: isEU ? $selectedValuesEU[1] : $selectedValuesUS[1])
                        .simultaneousGesture(TapGesture().onEnded {
                            DispatchQueue.main.async {
                                updateOnTap()
                            }
                        })
                    
                    CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), isSpacer: false,prefix: ".", selectedData: isEU ? $selectedValuesEU[2] : $selectedValuesUS[2])
                        .simultaneousGesture(TapGesture().onEnded {
                            DispatchQueue.main.async {
                                updateOnTap()
                            }
                        })
                }
                .padding(CustomPadding.tHalfPadding)
                VStack{
                    CustomGridText(data: ["NDV"], isSpacer: false,selectedData: $selectedNdv)
                        .padding(CustomPadding.tHalfPadding)
                        .simultaneousGesture(TapGesture().onEnded {
                            updateOnNdvChange()
                        })
                    Spacer()
                }
                
            }
            .frame(height : 65)
            
            
        }
        .frame(width: Dimensions.customSheetWidth)
        
        .onChange(of: isEU){
            updateResultant()
        }
        .onChange(of : isReset){ resetToInitialState()}
        
    }
    
    private func updateOnTap(){
        print("value printed")
        selectedNdv = nil
        
        updateResultant()
    }
    
    private func resetToInitialState() {
        selectedValuesEU = [nil, nil, nil]
        selectedValuesUS = [nil, nil, nil]
        isNdvEnable = false
        selectedNdv = nil
        isUpdating = false
    }
    
    private func updateResultant() {
        
        resultant = isEU ? calculateResultant(selected: selectedValuesEU, suffix: "KM") : calculateResultant(selected: selectedValuesUS, suffix: "SM")
        
    }
    
    
    private func updateOnNdvChange(){
        
        selectedValuesUS = [nil, nil, nil]
        selectedValuesEU = [nil, nil, nil]
        if selectedNdv != nil {
            updateResultant()
        }else{
            resultant = ndv
        }
    }
    
    
    private func calculateResultant(selected: [String?], suffix: String) -> String {

        let num1 = Int(selected[0] ?? "")
        let num2 = Int(selected[1] ?? "")
        let num3 = selected[2] ?? ""

        if num1 == nil && num2 == nil && num3.isEmpty {
            return ""
        } else if num1 != nil && num2 != nil {
            let sum = num1! + num2!
            if !num3.isEmpty {
                return "\(sum).\(num3)\(suffix)"
            } else {
                return "\(sum)\(suffix)"
            }
        } else if num1 == nil && num2 == nil {
            if !num3.isEmpty {
                return "0.\(num3)\(suffix)"
            } else {
                return ""
            }
        } else {
            let sum = (num1 ?? 0) + (num2 ?? 0)
            if !num3.isEmpty {
                return "\(sum).\(num3)\(suffix)"
            } else {
                return "\(sum)\(suffix)"
            }
        }
    }
}

struct VisibilityAtisFlightProgressView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper()
    }

    struct StatefulPreviewWrapper: View {
        @State private var resultant = ""
        @State private var isEU : Bool = true

        var body: some View {
            VisibilityAtisFlightProgressView(resultant: $resultant, isEU: $isEU, isReset: .constant(false))
        }
    }
}
