//
//  AppBarOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct AppBarOfpScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var text : String
    var body: some View{
            HStack{
                itemSpacingWidth()
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    AppBarText(text: AppTexts.close)
                }
                
                Spacer()

                AppBarText(text: text)
                    .padding(CustomPadding.vPadding)

                Spacer()
                
                
                IconImage(content: .customImage(Image(.updateButtonInactive)))

                itemSpacingWidth()
                
                IconImage(content: .customImage(Image(.confMenuCompDoc)))
                    .opacity(0.6)

                itemSpacingWidth()
                
                
            }
            .background(.appBar)
            .frame(height: Dimensions.appBarHeight)
            .padding(CustomPadding.tPadding)
    }
}

#Preview {
    AppBarOfpScreen(text: .constant("MMD5237 : ESSA-VABB : 11 JUL 2024 20:30 Z"))
}
