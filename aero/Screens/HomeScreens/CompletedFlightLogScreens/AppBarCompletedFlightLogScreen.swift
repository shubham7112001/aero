//
//  AppBarCompletedFlightLogScreen.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct AppBarCompletedFlightLogScreen: View {
    @Binding  var isOffset : Bool
    var body: some View {
        HomeScreenAppBar(
            isOffset: $isOffset,
            titleText: AppTexts.completedFlightLogs,
            actions: [
                AppBarTextIcon(text: AppTexts.edit).toAnyView(),
                
                IconImage(content: .customImage(Image(.loadUpWhite))).toAnyView()
            ])
    }
}

#Preview {
    AppBarCompletedFlightLogScreen(isOffset: .constant(false))
}
