//
//  RunwayConditionTakeOffOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct RunwayConditionTakeOffOfpScreen: View {
    @ObservedObject var viewModel: LandingTakeOffViewModel
    let backBarText: String
    var body: some View {
        DetailNavigationSplitView(leftText: backBarText, heading: "Runway condition"){
            
            MultiPopoverTakeOffSelection(headingText: "Braking action", list: viewModel.brakingList)
            
            itemSpacing()
            
            MultiPopoverTakeOffSelection(headingText: "Coverage", list: viewModel.coverageList)
            
            itemSpacing()
            
            MultiPopoverTakeOffSelection(headingText: "Depth", list: viewModel.depthList)
            
            itemSpacing()
            
            MultiPopoverTakeOffSelection(headingText: "Type", list: viewModel.typeList)
            
            itemSpacing()
            
            TextTextHStack(leftText: "Cleared width", rightText: "\(viewModel.clearedWidth)  m", rightOpacity: true)
                .wrapInButton {
                    viewModel.enableClearedWidthPopover()
                }
                .popover(isPresented: $viewModel.showClearedWidthPopover, content: {
                    CustomStandardPickerView(data: [viewModel.clearedWidth0to5, viewModel.clearedWidth0to9], selections: $viewModel.clearedWidthSelections)
                })
        
            
        }
    }
}

#Preview {
    RunwayConditionTakeOffOfpScreen(viewModel: LandingTakeOffViewModel(), backBarText: "Back Bar Text")
}
