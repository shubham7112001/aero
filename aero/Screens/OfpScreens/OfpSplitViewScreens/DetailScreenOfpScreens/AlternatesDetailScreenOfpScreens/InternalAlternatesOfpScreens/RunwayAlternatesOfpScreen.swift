//
//  RunwayAlternatesOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct RunwayAlternatesOfpScreen: View {
    @ObservedObject var alternatesViewModel: AlternatesOfpViewModel
    var body: some View {
        DetailNavigationSplitView(heading: "Runway", leadingActions: [
            Text("Alternate 1")
                .foregroundStyle(.dWhite)
                .toAnyView()
        ]){
            SingleItemSelectionView(itemsList: alternatesViewModel.runwayList)
        }
    }
}

#Preview {
    RunwayAlternatesOfpScreen(alternatesViewModel: AlternatesOfpViewModel())
}
