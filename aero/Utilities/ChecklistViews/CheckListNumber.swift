//
//  CheckListNumber.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CheckListNumber: View {
    var text : String
    var suffixNumber : Int
    @State var input : String = ""
    var isApplicable : Bool
    var body: some View {
        TextWithFieldHStack(text: text, input: $input, suffixText: String(describing : suffixNumber),isDisabled: !isApplicable)
            .opacity(isApplicable ? 1 : AppConstants.defaultOpacity)
    }
}

#Preview {
    CheckListNumber(text : "Checklist items", suffixNumber: 4, isApplicable: true)
}
