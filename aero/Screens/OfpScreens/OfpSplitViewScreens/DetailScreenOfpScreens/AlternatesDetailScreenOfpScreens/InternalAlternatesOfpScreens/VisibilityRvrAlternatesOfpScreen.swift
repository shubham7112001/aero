//
//  VisibilityRvrAlternatesOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct VisibilityRvrAlternatesOfpScreen: View {
    @ObservedObject var alternatesViewModel: AlternatesOfpViewModel
    var body: some View {
        DetailNavigationSplitView(heading: "Visibility", leadingActions: [
            Text("Alternate 1")
                .foregroundStyle(.dWhite)
                .toAnyView()
        ]){
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: "Visiblity", input: $alternatesViewModel.visiblity, suffixText: "m").toAnyView(),
                
                TextWithFieldHStack(text: "RVR", input: $alternatesViewModel.rvr, suffixText: "m").toAnyView()
            ])
            
        }
    }
}

#Preview {
    VisibilityRvrAlternatesOfpScreen(alternatesViewModel: AlternatesOfpViewModel())
}
