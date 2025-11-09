//
//  TextWIthToggleSwitch.swift
//  taillog
//
//  Created by Shubham Tiwari on 09/07/24.
//

import SwiftUI

struct TextWIthToggleSwitch: View {
    var text : String
    @Binding var isOn : Bool
    
    var body: some View {
        
        HStack{
            Toggle(isOn: $isOn, label: {
                Text(text)
                    .padding(CustomPadding.padding)
            })
            .padding(CustomPadding.rPadding)
        }
//        .frame(height: Dimensions.defaultRowHeight)
        
        .background(.dWhite)
        
    }
}

#Preview {
    TextWIthToggleSwitch(text: "HEllo Brother", isOn: .constant(true))
}
