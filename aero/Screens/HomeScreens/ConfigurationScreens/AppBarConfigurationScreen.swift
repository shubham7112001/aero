//
//  AppBarConfigurationScreen.swift
//  taillog
//
//  Created by Sword Software on 08/07/24.
//

import SwiftUI

struct AppBarConfigurationScreen: View {
    @Binding  var isOffset : Bool
    
    var body: some View{
        HomeScreenAppBar(
            isOffset: $isOffset,
            titleText: AppTexts.configuration,
            actions: [
                IconImage(content: .customImage(Image(.updateButtonInactive))).toAnyView(),
                
                AppBarIcon(icon: SFIcons.refreshIcon).toAnyView()
            ])
    }
}

#Preview {
    AppBarConfigurationScreen(isOffset: .constant(true))
}
