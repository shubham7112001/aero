//
//  AddFieldAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct AddFieldAtisFlightProgressView: View {
    @Binding var resultant : String
    @Binding var isReset : Bool
    
    @State var inputText : String = ""
    
    var body: some View {
        HStack{
            TextField("",text: $inputText)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.characters)
                .padding(CustomPadding.padding)
            Button{
                resultant = inputText.uppercased()
            }label:{
                Text("Add")
            }
            .padding(CustomPadding.padding)
            .background(.dWhite)
            .cornerRadius(6)
        }
        .frame(width: Dimensions.customSheetWidth)
        .padding(CustomPadding.vPadding)
        .onChange(of: isReset){
            resetToInitialState()
        }
    }
    private func resetToInitialState(){
        resultant = ""
        inputText = ""
    }
}

#Preview {
    AddFieldAtisFlightProgressView(resultant: .constant(""), isReset: .constant(false))
}
