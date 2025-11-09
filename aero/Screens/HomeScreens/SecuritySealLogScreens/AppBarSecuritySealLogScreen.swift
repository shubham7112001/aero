//
//  AppBarSecuritySealLogScreen.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct AppBarSecuritySealLogScreen: View {
    @Binding  var isOffset : Bool
    var body: some View {
        HomeScreenAppBar(
            isOffset: $isOffset,
            titleText: AppTexts.securitySealLog,
            actions: [
                AppBarIcon(icon: SFIcons.plus).toAnyView(),
                
                AppBarIcon(icon: SFIcons.refreshIcon).toAnyView()
            ])
    }
}

#Preview {
    AppBarSecuritySealLogScreen(isOffset: .constant(false))
}


