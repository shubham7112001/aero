//
//  CustomHeightSpacer.swift
//  taillog
//
//  Created by Shubham Tiwari on 09/07/24.
//

import SwiftUI

struct CustomHeightSpacer: View {
    var height : CGFloat
    var body: some View {
        Spacer()
            .frame(height: height)
    }
}

#Preview {
    CustomHeightSpacer(height: 10)
}
