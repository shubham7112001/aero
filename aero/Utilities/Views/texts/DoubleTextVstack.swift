//
//  DoubleTextVstack.swift
//  taillog
//
//  Created by Sword Software on 28/06/24.
//

import SwiftUI


struct DoubleTextVstack: View {
    var isSpacer: Bool = true
    var isBold : Bool = false
    var topText: String
    var bottomText: String
    var color : Color?
    var font : Font?
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(topText)
                    .font(font ?? AppFonts.defaultText)
                    .foregroundStyle( color ?? .white)
                    .fontWeight(isBold ? .bold : .none)
                
                Text(bottomText)
                    .font(font ?? AppFonts.defaultText)
                    .foregroundStyle( color ?? .white)
                    .fontWeight(isBold ? .bold : .none)
            }
            if(isSpacer){
                Spacer()
            }
        }
        
    }
}


