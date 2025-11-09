//
//  FacilitiesTakeOffOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct FacilitiesLandingTakeOffOfpScreen: View {
    @ObservedObject var viewModel: LandingTakeOffViewModel
    let backBarText: String
    var body: some View {
        DetailNavigationSplitView(leftText: backBarText, heading: "Facilities"){
            SingleItemSelectionView(itemsList: viewModel.fibnFacilitiesList)
            
            itemSpacing()
            
            SingleItemSelectionView(itemsList: viewModel.catIlsList)
        }
    }
}

#Preview {
    FacilitiesLandingTakeOffOfpScreen(viewModel: LandingTakeOffViewModel(), backBarText: "backBarText")
}
