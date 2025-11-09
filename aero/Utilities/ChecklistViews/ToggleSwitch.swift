//
//  CheckListSwitch.swift
//  taillog
//
//  Created by Shubham Tiwari on 17/09/24.
//

import SwiftUI

struct ToggleSwitch: View {
    var text : String
    @State var isOn : Bool = false;
    var isApplicable : Bool = true
    var body: some View {
        VStack{
            Toggle(text, isOn: $isOn)
                .padding(CustomPadding.hPadding)
                .disabled(!isApplicable)
            
        }
        .opacity(isApplicable ? 1 : AppConstants.defaultOpacity)
        .frame(height: Dimensions.defaultRowHeight)
        .background(.dWhite)
    }
}

#Preview {
    ToggleSwitch(text : "Text Shown Here", isOn: true, isApplicable: true)
}
