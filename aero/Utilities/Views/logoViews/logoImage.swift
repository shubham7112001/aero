//
//  logo_image.swift
//  taillog
//
//  Created by Sword Software on 24/06/24.
//

import SwiftUI

struct logoImage: View {
    var body: some View {
        Image(.logo)
            .resizable()
            .frame(width: 177,height: 177)
            .padding(CustomPadding.padding)
    }
}

#Preview {
    logoImage()
}
