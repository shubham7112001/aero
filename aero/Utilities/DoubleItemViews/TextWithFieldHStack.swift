//
//  TextWithFieldHStack.swift
//  taillog
//
//  Created by Shubham Tiwari on 06/08/24.
//

import SwiftUI
import Combine

struct TextWithFieldHStack: View {
    var text : String
    @Binding var input : String
    var hintText : String?
    var font: Font = AppFonts.defaultText
    var suffixText: String?
    var height: CGFloat?
    var keyboardType: UIKeyboardType?
    var suffixTextOpacity: Bool?
    var leftColor: Color?
    var isDisabled : Bool = false
    var body: some View {
        HStack(spacing: 0){
            itemSpacingWidth()
            Text(text)
                . font(font)
                .fontWeight(.regular)
                .foregroundStyle(isDisabled ? AppColors.gray : leftColor ?? .black)
                .padding(CustomPadding.vPadding)
            Spacer()
            TextField(
                hintText ?? "",
                text: $input
            )
            .keyboardType(keyboardType ?? .default)
            .font(font)
            .multilineTextAlignment(.trailing)
            .padding(CustomPadding.rPadding)
            .opacity(AppConstants.defaultOpacity)
            .disabled(isDisabled)
            
            
            if(suffixText != nil){
                Text("\(suffixText!)")
                    .font(font)
                    .fontWeight(.regular)
                    .foregroundStyle(.black )
                    .padding(CustomPadding.rPadding)
                    .opacity(AppConstants.defaultOpacity)
            }
        }
        .background()
        .frame(height: height ?? Dimensions.defaultRowHeight)
    }
}

#Preview {
    TextWithFieldHStack(text : "Data", input: .constant(""))
}
