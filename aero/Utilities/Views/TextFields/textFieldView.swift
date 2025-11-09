//
//  textFieldView.swift
//  taillog
//
//  Created by Sword Software on 24/06/24.
//

import SwiftUI

 struct textFieldView: View {
    
    @Binding  var binding : String
     var text : String
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: Dimensions.textFieldWidth + 10, height: Dimensions.textFieldHeight)
                .foregroundStyle(.white)
                .cornerRadius(5)
            TextField(text, text: $binding)
                .frame(width: Dimensions.textFieldWidth, height: Dimensions.textFieldHeight)
                .font(AppFonts.smallText)
                .autocapitalization(.none)
        }
        
    }
}

#Preview {
    
    textFieldView(binding: .constant("E mail"), text: "Email")
}
