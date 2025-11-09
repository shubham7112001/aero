//
//  VerticalWhiteDivider.swift
//  taillog
//
//  Created by Sword Software on 28/06/24.
//

import SwiftUI

struct VerticalDivider: View {
    var isPadding : Bool = true;
    var height : CGFloat = 10 ;
    var color : Color = .white
    var body: some View {
        
        Rectangle()
            .fill(color)
            .frame(width: 1, height: height)
        
    }
}

#Preview {
    VerticalDivider()
}
