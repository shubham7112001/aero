//
//  btn.swift
//  taillog
//
//  Created by Sword Software on 24/06/24.
//

import SwiftUI

struct simpleBtn: View {
    var btnText : String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: Dimensions.btnWidth, height: Dimensions.btnHeight)
                .cornerRadius(Dimensions.btnRadius)
                .foregroundStyle(.btn)
            
            Text(btnText)
                .foregroundStyle(.white)
        }
    }
}
//#Preview {
//    btn()
//}
