//
//  AppBarCompanyDocumentsScreen.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct AppBarCompanyDocumentsScreen: View {
    @Binding  var isOffset : Bool
    var body: some View {
        HomeScreenAppBar(
            isOffset: $isOffset,
            titleText: AppTexts.companyDocuments,
            actions: [
                AppBarText(text: AppTexts.downloadAll)
                    .toAnyView(),
                
                AppBarIcon(icon: SFIcons.refreshIcon)
                    .toAnyView()
            ])
    }
}

#Preview {
    AppBarCompanyDocumentsScreen(isOffset: .constant(false))
}
