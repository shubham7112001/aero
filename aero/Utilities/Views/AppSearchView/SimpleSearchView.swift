//
//  SimpleSearchView.swift
//  taillog
//
//  Created by Shubham Tiwari on 12/08/24.
//

import SwiftUI

struct SimpleSearchView: View {
    var hintText: String
    @Binding var input: String
    var body: some View {
        HStack{
            Image(systemName: SFIcons.search)
                .opacity(AppConstants.defaultOpacity)
            TextField(hintText, text: $input)
                .padding(CustomPadding.vPadding)
                
        }
        .padding(CustomPadding.hPadding)
        .background(Color(.systemGray6).cornerRadius(8))
        .frame(height: Dimensions.defaultRowHeight)
    }
}

#Preview {
    SimpleSearchView(hintText: "Hint text",input: .constant(""))
}
