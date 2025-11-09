//
//  CustomTextEditor.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/09/24.
//

import SwiftUI

struct CustomTextEditor: View {
    @Binding var inputText: String
    @FocusState private var isTextEditorFocused: Bool
    var height : CGFloat = 170
    var hintText : String = "Enter your text here..."
    var isLeftPadding : Bool = true;
    var font : Font = AppFonts.smallText
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $inputText)
                .focused($isTextEditorFocused)
                .padding(isLeftPadding ? CustomPadding.lPadding : CustomPadding.none)
                .font(font)
                .cornerRadius(5)
                .onTapGesture {
                    isTextEditorFocused = true
                }
            if inputText.isEmpty && !isTextEditorFocused {
                Text(hintText)
                    .foregroundColor(.gray)
                    .padding(CustomPadding.padding)
                    .font(font)
            }
            
        }
        .frame(height: height)
    }
}


#Preview {
    CustomTextEditor(inputText : .constant(""))
}
