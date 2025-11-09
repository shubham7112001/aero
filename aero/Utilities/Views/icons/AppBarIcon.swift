//
//  AppBarIcon.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct AppBarIcon: View {
    var icon : String
    var body: some View {
        Image(systemName: icon)
            .frame(height: Dimensions.iconSize)
            .foregroundStyle(.white)
            .frame(width: 40, height:  40)
    }
}

#Preview {
    AppBarIcon(icon: "refresh")
}
