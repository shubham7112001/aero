//
//  AppBarTextIcon.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct AppBarTextIcon: View {
    var text : String
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .opacity(AppConstants.defaultOpacity)
    }
}

#Preview {
    AppBarTextIcon(text: "text")
}
