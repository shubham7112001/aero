//
//  errorText.swift
//  taillog
//
//  Created by Sword Software on 25/06/24.
//

import SwiftUI

struct AppErrorText: View {
    
    @Binding var text : String
    var body: some View {
        if(!text.isEmpty){
            Text(text)
                .font(AppFonts.errorFont)
                .foregroundStyle(.red)
                .background(.white)
                .padding(CustomPadding.padding)
                .background(
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(Dimensions.btnRadius)
                    )
        }
            
    }
}

#Preview {
    AppErrorText(text: .constant("error"))
}
