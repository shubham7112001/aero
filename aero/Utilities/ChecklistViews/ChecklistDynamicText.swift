//
//  CheckListSimpleTextWithCheck.swift
//  taillog
//
//  Created by Shubham Tiwari on 17/09/24.
//

import SwiftUI

struct ChecklistDynamicText: View {
    var checklistNumber : Int
    var text : String
    
    @State var isCheck : Bool = false;
    var body: some View {
        NavigationStack{
            VStack {
                NavigationLink{
                    ChecklistMultipleItems(checklistNumber: 1)
                }label:{
                    HStack(alignment : .top) {
                        VStack{
                            Text("Checklist number \(checklistNumber)")
                                .foregroundStyle(.black)
                        }
                        Spacer()
                        HStack{
                            
                            
                            LongAlignedText(text: isCheck ? text : "Select Value")
                            
                            Image(systemName: SFIcons.rightChevron)
                                .foregroundStyle(.black)
                        }
                        .opacity(AppConstants.defaultOpacity)
                        
                    }
                }
                .padding(CustomPadding.padding)
                .background(.dWhite)
            }
        }
    }
}

#Preview {
    ChecklistDynamicText(checklistNumber: 1, text: AppTexts.sampleVeryLargeText)
}
