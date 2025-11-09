//
//  TextDividerTextVstack.swift
//  taillog
//
//  Created by Shubham Tiwari on 12/07/24.
//

import SwiftUI

struct TextDividerTextVstack: View {
    var upperText : String
    var lowerText : String
    var body: some View {
        VStack{
            TextWithAutoAdjustments(width: Dimensions.navigationSplitViewDetailWidth, text: upperText)
            Divider()
                .padding(CustomPadding.lPadding)
            TextWithAutoAdjustments(width: Dimensions.navigationSplitViewDetailWidth, text: lowerText)
            
        }
        .background(.white)
    }
}

#Preview {
    TextDividerTextVstack(upperText: "100550Z 13006KT CAVOK 16/10 Q1023 NOSIG=", lowerText: "100530Z 1006/1106 13007KT CAVOK PROB40 1014/1020 12015G25KT TEMPO 1021/1104 SHRA BKN030CB BECMG 1104/1106 BKN006==")
}
