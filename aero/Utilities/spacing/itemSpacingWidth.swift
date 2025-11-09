//
//  itemSpacingWidth.swift
//  taillog
//
//  Created by Sword Software on 25/06/24.
//

import SwiftUI

struct itemSpacingWidth: View {
    var width : CGFloat = Dimensions.spaceBwItems
    var body: some View {
        Spacer()
            .frame(width: width)
    }
}

#Preview {
    itemSpacingWidth()
}
