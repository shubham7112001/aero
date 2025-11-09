//
//  CapitalizedTextWithIcon.swift
//  taillog
//
//  Created by Shubham Tiwari on 12/07/24.
//

import SwiftUI

struct CapitalizedTextWithImage: View {
    var text : String
    var image : ImageResource
    var body: some View {
        HStack{
            CapitalizedTextHalfOpacity(text: text)
                .padding(CustomPadding.tPadding)
            Spacer()
            Image(image)
            itemSpacingWidth()
        }
    }
}


#Preview {
    CapitalizedTextWithImage(text: "HEllo world", image: .copyButton)
}
