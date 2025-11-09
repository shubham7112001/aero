//
//  TemperatureDewpointTakeOffOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct TemperatureDewpointLandingTakeOffOfpScreen: View {
    @ObservedObject var viewModel: LandingTakeOffViewModel
    let backBarText: String
    var body: some View {
        DetailNavigationSplitView(leftText: backBarText, heading: "Temp/Dewpoint"){
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: "Temperature", input: $viewModel.temperature, suffixText: "\(AppTexts.degreeSymbol)C").toAnyView(),
                
                TextWithFieldHStack(text: "Dewpoint", input: $viewModel.dewpoint, suffixText: "\(AppTexts.degreeSymbol)C").toAnyView()
            ])
            
        }
    }
}

#Preview {
    TemperatureDewpointLandingTakeOffOfpScreen(viewModel: LandingTakeOffViewModel(), backBarText: "backBarText")
}
