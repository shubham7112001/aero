//
//  SidebarSpacing.swift
//  taillog
//
//  Created by Shubham Tiwari on 22/07/24.
//

import SwiftUI

struct SidebarSpacing: View {
    var body: some View {
        Divider()
            .background(.black)
            .frame(width: Dimensions.sidebarWidth - Dimensions.defaultPadding * 2, height: Dimensions.defaultPadding)
            .padding(CustomPadding.padding)
    }
}

#Preview {
    SidebarSpacing()
}
