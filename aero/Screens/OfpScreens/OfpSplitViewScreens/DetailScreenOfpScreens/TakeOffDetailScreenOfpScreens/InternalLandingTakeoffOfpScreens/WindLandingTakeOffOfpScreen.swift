//
//  WindTakeOffOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct WindLandingTakeOffOfpScreen: View {
    @ObservedObject var viewModel: LandingTakeOffViewModel
    let backBarText: String
    var body: some View {
        DetailNavigationSplitView(leftText: backBarText,heading: "Wind"){
            VStack(spacing: 0){
                TextWithFieldHStack(text: "Direction", input: $viewModel.windInputs[0], suffixText: AppTexts.degreeSymbol)
                
                Divider().padding(CustomPadding.lPadding)
                
                TextWithFieldHStack(text: "Velocity", input: $viewModel.windInputs[1], suffixText: "kt")
                
            }
            .background(.dWhite)
            
            itemSpacing()
            
            TextWithFieldHStack(text: "Gust", input: $viewModel.windInputs[2], suffixText: "kt")
        }
    }
}

#Preview {
    WindLandingTakeOffOfpScreen(viewModel: LandingTakeOffViewModel(),backBarText: "backBarText")
}
