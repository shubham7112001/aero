//
//  MultiPopoverSelection.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct MultiPopoverTakeOffSelection: View {
    var headingText: String = ""
    let list : [String]
    var body: some View {
        VStack(spacing: 0){
            if(!headingText.isEmpty){
                CapitalizedTextHalfOpacity(text: headingText)
            }
            
            VStack(spacing: 0){
                CustomPopoverPicker(list: list,  leftText: "1st runway part", isIcon: true, showFirst: true)
                Divider().padding(CustomPadding.lPadding)
                CustomPopoverPicker(list: list, leftText: "2nd runway part", isIcon: true, showFirst: true)
                Divider().padding(CustomPadding.lPadding)
                CustomPopoverPicker(list: list, leftText: "3rd runway part", isIcon: true, showFirst: true)
            }
        }
    }
}

#Preview {
    MultiPopoverTakeOffSelection(list: ArrayTexts.cloudsAtisCavokList)
}
