//
//  SwiftUIView.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct AppBarAvailableFlightPlanScreen: View {
    @Binding  var isOffset : Bool
    @Binding var moveToOfpScreen : Bool
    
    var body: some View{
            HomeScreenAppBar(
                isOffset: $isOffset,
                titleText: AppTexts.avlFlightPlan,
                actions: [
                    
                    Button{
                        moveToOfpScreen = true
                    }label: {
                        DarkText(text: AppTexts.edit,isBlack: false)
                            .padding(CustomPadding.hPadding)
                    }
                        .toAnyView(),
                    
                    IconImage(content: .customImage(Image(.updateButtonInactive))).toAnyView(),
                    
                    AppBarIcon(icon: SFIcons.refreshIcon).toAnyView()
                    
                    
                ])
    }
}

#Preview {
    AppBarAvailableFlightPlanScreen(isOffset: .constant(false), moveToOfpScreen: .constant(false))
}
