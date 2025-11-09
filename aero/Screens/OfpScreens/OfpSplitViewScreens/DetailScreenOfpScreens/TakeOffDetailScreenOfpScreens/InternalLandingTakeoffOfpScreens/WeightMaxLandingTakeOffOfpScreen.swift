//
//  WeightMaxTakeOffOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct WeightMaxLandingTakeOffOfpScreen: View {
    @ObservedObject var viewModel: LandingTakeOffViewModel
    let backBarText: String
    var body: some View {
        DetailNavigationSplitView(leftText: backBarText, heading: "Weight"){
            DividerWithActionsVstack(actions:[
                TextTextHStack(leftText: "Take-off weight", rightText: "29545 lb",leftOpacity: true, rightOpacity: true).toAnyView(),
                TextTextHStack(leftText: "Max. take-off weight", rightText: "42800 lb", leftOpacity: true, rightOpacity: true).toAnyView(),
                TextWithFieldHStack(text: "Regulated max. take-off weight", input: $viewModel.maxRegulateWeight, suffixText:  "lb").toAnyView()
                
            ])
        }
    }
}

#Preview {
    WeightMaxLandingTakeOffOfpScreen(viewModel: LandingTakeOffViewModel(), backBarText: "backBarText")
}
