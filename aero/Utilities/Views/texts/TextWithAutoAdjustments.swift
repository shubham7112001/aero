//
//  TextWithAutoAdjustments.swift
//  taillog
//
//  Created by Shubham Tiwari on 11/07/24.
//

import SwiftUI

struct TextWithAutoAdjustments: View {
    var bgClr : Color = Color.white
    var width : CGFloat = 10
    var text : String
    var opacity : CGFloat = AppConstants.defaultOpacity
    var body: some View {
        VStack{
            HStack{
                Text(text)
                    .opacity(opacity)
                Spacer()
            }
        }
        .background(bgClr)
        .padding(CustomPadding.padding)
    }
}

#Preview {
    TextWithAutoAdjustments(text: "Data to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be providedData to be provided")
}
