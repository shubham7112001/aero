//
//  DelayCodeView.swift
//  taillog
//
//  Created by Shubham Tiwari on 17/12/24.
//

import SwiftUI

struct DelayCodeView: View {
    @State var model: DelayCodesModel
    @Binding var check : Bool
    @Binding var extended : String?
    @Binding var selected: Int
    @State var showPopover : Bool = false
        
    @State private var selections: [Int] = [1000, 1020]
    var width: CGFloat = Dimensions.customSheetWidth
    var onTap : () -> Void = {}
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("\(model.id) \(model.code_id.isEmpty ? "" : "(\(model.code_id)\(model.sub_code.isEmpty ? "" : "- \(model.sub_code)"))" ) \(!model.code_name.isEmpty ? ": \(model.code_name)" : "")")
                    .font(AppFonts.defaultText)
                    .foregroundStyle(.black)
                
                Text(model.code_description)
                    .font(AppFonts.smallText)
                    .opacity(AppConstants.defaultOpacity)
            }
            .padding(CustomPadding.padding)
            
            Spacer()
            
            VStack{
                if(check && selected == 0){
                        IconImage(content: .systemImage(SFIcons.checkmark), size: 16,color: .blue)
                        .transaction { $0.animation = nil }
                }
                if(selected == 1){
                    Text(extended ?? "")
                        .opacity(AppConstants.defaultOpacity)
                }
                
            }
            .padding(CustomPadding.rPadding)
            
        }
        .wrapInButton {
            onTap()
            if(selected == 1){
                showPopover.toggle()
            }
        }
        .frame(width: width)
        .background(.dWhite)
        .popover(isPresented: $showPopover, content: {
            VStack{
                CustomStandardPickerView(data: DelayCodes.pickerData, selections: self.$selections)
            }
        })
        .onChange(of: selections){
            extended = "\(String(format: "%02d", selections[0] % 10)):\(String(format: "%02d", selections[1] % 60))"
        }
    }
    
}
