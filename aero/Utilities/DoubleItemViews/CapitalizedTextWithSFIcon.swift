//
//  CapitalizedTextWithIcon.swift
//  taillog
//
//  Created by Shubham Tiwari on 06/08/24.
//

import SwiftUI

struct CapitalizedTextWithSFIcon: View {
    var text : String
    var image : String
    var font : Font?
    var imgSize : CGFloat?
    var onIconTap : (() -> Void)?
    var body: some View {
        HStack{
//            itemSpacingWidth()
            VStack{
                Spacer()
                
                Text(text.uppercased())
                    .font(font ?? AppFonts.defaultText)
                    .opacity(AppConstants.defaultOpacity)
                
                CustomHeightSpacer(height: 2)
                
            }
            Spacer()
            Image(systemName: image)
                .font(.system(size: imgSize ?? 25))
                .onTapGesture {
                    onIconTap?()
                }
        }
        .padding(CustomPadding.hPadding)
        .frame(height: Dimensions.defaultRowHeight)
    }
}

#Preview {
    CapitalizedTextWithSFIcon(text: "data", image: SFIcons.trash)
}
