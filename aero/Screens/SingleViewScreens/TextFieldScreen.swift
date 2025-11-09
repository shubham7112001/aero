//
//  TextFieldScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/09/24.
//

import SwiftUI

struct TextFieldScreen: View {
    @Environment(\.dismiss) private var context;
    var centerHeadingText : String
    var leftText : String
    @Binding var input : String
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
            VStack(spacing : 0){
                HeadingInternalScreenOfpScreen(leftText: leftText, centerText: centerHeadingText)
                
                ScrollView{
                    VStack(spacing : 0) {
                        sectionSpacing()
                        VStack{
                            TextEditor(text: $input)
                        }
                        .frame(height: Dimensions.singleViewBoxHeight)
                        .background(.dWhite)
                        
                        Spacer()
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}
