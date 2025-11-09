//
//  RoundedRectangularIcon.swift
//  taillog
//
//  Created by Sword Software on 25/06/24.
//

import SwiftUI

struct RoundedRectangularIcon : View {
    
    var icon : String
    var color : Color = .main
    var size : CGFloat = 42
    var imgSize : CGFloat = 20
    var cornerRadius : CGFloat = 25
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .border(.white)
                .foregroundColor(color)
                .frame(width: size, height: size)
                .overlay(
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: imgSize, height: imgSize)
                        .foregroundColor(.white)
                )
            
            
        }
    }
}
#Preview {
    RoundedRectangularIcon(icon: "chevron.left")
}
