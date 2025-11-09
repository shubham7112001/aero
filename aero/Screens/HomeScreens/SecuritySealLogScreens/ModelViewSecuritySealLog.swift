//
//  ModelViewSecuritySealLog.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct ModelViewSecuritySealLog : View {
    var body: some View {
        VStack{
            HStack(){
                itemSpacingWidth()
                Image(.sslListpagePending)
                LightBlackText(text: "OY-NEW")
                Spacer()
                LightBlackText(text: "AAXX/ / Rothera Point Airport")
                Spacer()
                LightBlueText(text : "05 APR 2024 10:54 Z")
                Spacer()
                Image(.nextArrowGrey)
                
                itemSpacingWidth()
            }
            .padding(EdgeInsets(top: Dimensions.topPadding, leading: Dimensions.leftPadding, bottom: Dimensions.bottomPadding, trailing: Dimensions.rightPadding))
            
            Divider()
        }
    }
}

#Preview {
    ModelViewSecuritySealLog()
}
