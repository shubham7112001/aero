//
//  RoundedRectangularImage.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct RoundedSquareImage: View {
    let content: IconImageContent
    var size : CGFloat = 100
    var cornerRadius : CGFloat = 10
    var iconColor : Color = .white
    
    var body: some View{
            switch content {
            case .systemImage(let imageName):
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .foregroundColor(iconColor)
                    .cornerRadius(cornerRadius)
                
            case .customImage(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .foregroundColor(.white)
                    .cornerRadius(cornerRadius)
            }
        }
//    }
}

struct RoundedSquareImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IconImage(content: .systemImage("star.fill"))
            IconImage(content: .customImage(Image(.updateButtonInactive)))
        }
    }
}
