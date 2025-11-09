//
//  VisibilityRvrTakeOffOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct VisibilityRvrLandingTakeOffOfpScreen: View {
    @ObservedObject var viewModel: LandingTakeOffViewModel
    let backBarText: String
    var body: some View {
        DetailNavigationSplitView(leftText: backBarText, heading: "Visibility"){
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: "Visiblity", input: $viewModel.visiblity, suffixText: "m").toAnyView(),
                
                TextWithFieldHStack(text: "RVR", input: $viewModel.rvr, suffixText: "m").toAnyView()
            ])
            
        }
    }
}

#Preview {
    VisibilityRvrLandingTakeOffOfpScreen(viewModel: LandingTakeOffViewModel(), backBarText: "backBarText")
}
