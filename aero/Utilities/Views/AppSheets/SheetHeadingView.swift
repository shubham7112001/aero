//
//  SheetHeadingView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct SheetHeadingView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var heading : String
    var cancelText : String = "Cancel"
    var cancelTextColor: Color = .mainBlue
    var functionText: String = ""
    var function : () -> Void = {}
    var cancelFunction : (() -> Void)?
    var headingColor : Color = .black
    var isLeftIconEnable : Bool = false
    var bgColor: Color = .dWhite
    var body: some View {
        HStack{
            if(isLeftIconEnable){
                Image(systemName: SFIcons.leftChevron)
                    .font(AppFonts.defaultText)
                    .foregroundStyle(.mainBlue)
            }
            Text(cancelText)
                .foregroundStyle(cancelTextColor)
                .font(AppFonts.defaultText)
                .wrapInButton {
                    if let cancelFunction = cancelFunction {
                        cancelFunction()
                    } else {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            Spacer()
            Text(functionText)
                .foregroundStyle(.mainBlue)
                .wrapInButton {
                            function()
                    
                }
        }
        .padding()
        .background(bgColor)
        .overlay(
            Text(heading)
                .foregroundStyle(headingColor)
                .font(AppFonts.defaultText)
        )
    }
}

#Preview {
    SheetHeadingView(heading: "Heading", functionText: "Function Text",function: {
        print("HI")
    })
}
