//
//  CheckListOnlyCheck.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CheckListOnlyCheck: View {
    var checklistNumber : Int
    var text : String
    var isApplicable : Bool
    
    @State var isCheck : Bool = false;
    var body: some View {
        VStack {
                HStack(alignment : .top) {
                    VStack{
                        Text("Checklist number \(checklistNumber)")
                            .foregroundStyle(.black)
                            .font(AppFonts.defaultText)
                            .opacity(isApplicable ? 1 : AppConstants.defaultOpacity)
                    }
                    Spacer()
                    HStack{
                        
                        LongAlignedText(text: text)
                        
                        
                        Image(systemName: isCheck ? SFIcons.checkmark : SFIcons.multiply)
                            .foregroundStyle(isCheck ? .blue : .red)
                            .font(.system(size : 24))
                            .fontWeight(.bold)
                            .frame(width: Dimensions.iconSize, height: Dimensions.iconSize)
                    }
                    .opacity(AppConstants.defaultOpacity)
                    
                    .onTapGesture {
                        if(isApplicable){
                            isCheck.toggle();
                        }
                    }
            }
            .padding(CustomPadding.padding)
            .background(.dWhite)
        }
    }
}

#Preview {
    CheckListOnlyCheck(checklistNumber: 1, text: AppTexts.sampleVeryLargeText, isApplicable: true)
}
