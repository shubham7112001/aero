//
//  CustomWidthSpacer.swift
//  taillog
//
//  Created by Shubham Tiwari on 09/07/24.
//

import SwiftUI

struct CustomWidthSpacer: View {
    var width : CGFloat
    var body: some View {
        Spacer()
            .frame(width: width)
    }
}

#Preview {
    CustomWidthSpacer(width: 10)
}
