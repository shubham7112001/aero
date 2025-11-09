//
//  IconImageContentSquareWithBg.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct IconImageContentSquareWithBg: View {
    let content : IconImageContent
    
    var body: some View {
        
            RoundedRectangle(cornerRadius: 25)
                .border(.white)
                .foregroundColor(.main)
                .frame(width: 42, height: 42)
                .overlay(
                    IconImage(content: content)
                )
            
    }
}

#Preview {
    IconImageContentSquareWithBg(content: .customImage(Image(.confMenuCompDoc)))
}
