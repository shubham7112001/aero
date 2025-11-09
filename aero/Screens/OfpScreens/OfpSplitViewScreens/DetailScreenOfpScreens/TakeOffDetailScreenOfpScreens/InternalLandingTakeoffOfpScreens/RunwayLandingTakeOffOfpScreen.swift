//
//  RunwayTakeOffOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct RunwayLandingTakeOffOfpScreen: View {
    @ObservedObject var viewModel: LandingTakeOffViewModel
    let backBarText: String
    var body: some View {
        DetailNavigationSplitView(leftText: backBarText, heading: "Runway"){
            SingleItemSelectionView(itemsList: viewModel.runwayList)
        }
    }
}

#Preview {
    RunwayLandingTakeOffOfpScreen(viewModel: LandingTakeOffViewModel(), backBarText:  "BackBarText")
}
