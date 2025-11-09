//
//  NumberWithFieldHStack.swift
//  taillog
//
//  Created by Shubham Tiwari on 12/12/24.
//

import SwiftUI

struct NumberWithFieldHStack<V>: View where V: Numeric & LosslessStringConvertible{
    var text : String
    @Binding var input : V
    var hintText : String?
    var font: Font = AppFonts.defaultText
    var suffixText: String?
    var height: CGFloat?
    var suffixTextOpacity: Bool?
    var leftColor: Color?
    var isDisabled : Bool = false
    var body: some View {
        HStack(spacing: 0){
            itemSpacingWidth()
            Text(text)
                . font(font)
                .fontWeight(.regular)
                .foregroundStyle(isDisabled ? .gray : leftColor ?? .black)
                .padding(CustomPadding.vPadding)
            Spacer()
            NumberTextField(value: $input)
                .opacity(AppConstants.defaultOpacity)
            .font(font)
            .multilineTextAlignment(.trailing)
            .padding(CustomPadding.hv(h: 4))
            
            
            
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
        .disabled(isDisabled)
        .frame(height: height ?? Dimensions.defaultRowHeight)
    }
}
