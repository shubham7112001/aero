//
//  FacilitiesAlternatesOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct FacilitiesAlternatesOfpScreen: View {
    @ObservedObject var alternatesViewModel: AlternatesOfpViewModel
    var body: some View {
        DetailNavigationSplitView(heading: "Facilities", leadingActions: [
            Text("Alternate 1")
                .foregroundStyle(.dWhite)
                .toAnyView()
        ]){
            SingleItemSelectionView(itemsList: alternatesViewModel.fibnFacilitiesList)
            
            itemSpacing()
            
            SingleItemSelectionView(itemsList: alternatesViewModel.catIlsList)
        }
    }
}

#Preview {
    FacilitiesAlternatesOfpScreen(alternatesViewModel: AlternatesOfpViewModel())
}
