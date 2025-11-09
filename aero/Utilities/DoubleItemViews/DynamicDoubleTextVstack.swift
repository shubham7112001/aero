//
//  DynamicDoubleTextVstack.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct DynamicDoubleTextVstack: View {
    var upperText: String
    var lowerText: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            Text(upperText)
                .padding(CustomPadding.padding)
            
            Divider()
                .padding(CustomPadding.lPadding)
            
            Text(lowerText)
                .padding(CustomPadding.padding)
        }
        .opacity(AppConstants.defaultOpacity)
        .background(.dWhite)
    }
}

#Preview {
    DynamicDoubleTextVstack(upperText: "UpperText", lowerText: "LowerText")
}
