//
//  DynamicChecks.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct DynamicChecks: View {
    var isCheck : Bool
    var body: some View {
        Image(systemName: isCheck ? SFIcons.checkmark : SFIcons.multiply)
            .foregroundStyle(isCheck ? .mainBlue : .red)
            .font(.system(size : 24))
            .fontWeight(.bold)
            .frame(width: Dimensions.iconSize, height: Dimensions.iconSize)
    }
}

#Preview {
    DynamicChecks(isCheck: true)
}
