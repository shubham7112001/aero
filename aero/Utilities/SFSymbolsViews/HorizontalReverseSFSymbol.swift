//
//  HorizontalReverseSFSymbol.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/06/24.
//

import SwiftUI

struct HorizontalReverseSFSymbol: View {
    var sysImg : String
    var body: some View {
        VStack {
            IconImage(content: .systemImage(sysImg))
                .rotationEffect(.degrees(180))
                .scaleEffect(x: 1, y: -1)
        }
    }
}

#Preview {
    HorizontalReverseSFSymbol(sysImg: "arrow.right")
}
