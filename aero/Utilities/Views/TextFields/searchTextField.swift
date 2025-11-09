//
//  searchTextField.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct searchTextField: View {
    @Binding var text : String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: Dimensions.screenSize.width * 0.1 , height: Dimensions.textFieldHeight * 0.75)
                .foregroundColor(Color(AppColors.lightGreyColor))
                .overlay(
                    RoundedRectangle(cornerRadius: Dimensions.searchFieldRadius)
                        .foregroundColor(.white)
                )
            
            TextField("", text : $text)
                .frame(width: Dimensions.screenSize.width * 0.1 - 5 , height: Dimensions.textFieldHeight * 0.7)
        }
    }
}

#Preview {
    searchTextField(text: .constant("Data"))
}
