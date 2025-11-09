//
//  CheckListSingleLineFiels.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CheckListSingleLineField: View {
    @State var input : String = "";
    var text: String;
    var isApplicable : Bool
    var body: some View {
        TextWithFieldHStack(text: text, input: $input, hintText: "Enter text", isDisabled: !isApplicable)
            .opacity(isApplicable ? 1 : AppConstants.defaultOpacity)
    }
}

#Preview {
    CheckListSingleLineField(text : "Type some text", isApplicable: true)
}
