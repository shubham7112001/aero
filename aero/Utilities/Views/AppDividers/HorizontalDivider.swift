//
//  HorizontalWhiteDivider.swift
//  taillog
//
//  Created by Shubham Tiwari on 28/06/24.
//

import SwiftUI

struct HorizontalDivider: View {
    var isPadding : Bool = true;
    var height : CGFloat = 3;
    var color : Color = .white
    var body: some View {
        
        Rectangle()
            .fill(color)
            .frame(height: height)
            .padding( isPadding ? CustomPadding.hPadding : EdgeInsets())
        
    }
}

#Preview {
    HorizontalDivider()
}
