//
//  InformationIdAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct InformationIdAtisFlightProgressView: View {
    @Binding var resultant : String
    @Binding var isReset : Bool
    @State var selected : String?
    
    var body: some View {
        VStack(spacing: CustomPadding.defaultPadding - 2){
            CapitalizedTextHalfOpacity(text: "Information ID", font: AppFonts.atisCapitalizedFont)
            CustomGridText(data: ArrayTexts.a2m, data2: ArrayTexts.n2z,selectedData: $selected)
        }
        .frame(width: Dimensions.customSheetWidth)
        .onChange(of: selected){
            resultant = selected ?? ""
        }
        .onChange(of: isReset){
            onReset()
        }
    }
    private func onReset(){
        selected = nil
    }
}

#Preview {
    InformationIdAtisFlightProgressView(resultant: .constant("asdasdf"),isReset: .constant(false))
}
