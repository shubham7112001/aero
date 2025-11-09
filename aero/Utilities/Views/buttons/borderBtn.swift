//
//  borderBtn.swift
//  taillog
//
//  Created by Sword Software on 24/06/24.
//

import SwiftUI

struct borderBtn: View {
    var text : String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: Dimensions.btnWidth, height: Dimensions.btnHeight)
            .border(.white)
            .cornerRadius(Dimensions.btnRadius)
            .foregroundStyle(.clear)
            
            Text(text)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    borderBtn(text : "ButtoN")
}
