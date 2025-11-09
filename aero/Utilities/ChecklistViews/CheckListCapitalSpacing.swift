//
//  CheckListCapitalSpacing.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CheckListCapitalSpacing: View {
    var checkListNumber : Int
    var body: some View {
        VStack{
            CapitalizedTextHalfOpacity(text: "[CheckList item \(checkListNumber)]")
                .padding(CustomPadding.vPadding)
        }
        .background(.veryLightGrey)
    }
}

#Preview {
    CheckListCapitalSpacing(checkListNumber: 1)
}
