//
//  CheckListPopoverSeletedItems.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CustomPopoverPicker: View {
    var checklistNumber : Int = 0
    var list : [String] = []
    var leftText: String = ""
    @State private var selectedText = ""
    @State private var showPopup : Bool = false;
    var isApplicable : Bool = true;
    var isIcon: Bool = false
    var showFirst : Bool = false
    var body: some View {
        VStack {
            HStack(alignment : .top) {
                VStack{
                    Text(!leftText.isEmpty ? leftText : "Checklist item \(checklistNumber)")
                        .foregroundStyle(.black)
                        .opacity(isApplicable ? 1 : AppConstants.defaultOpacity)
                        .font(AppFonts.defaultText)
                }
                Spacer()
                HStack(alignment: .top){
                    VStack{
                        LongAlignedText(text : selectedText);
                    }
                }
                
                if(isIcon){
                    Image(systemName: SFIcons.rightChevron)
                        .opacity(AppConstants.defaultOpacity)
                        .font(AppFonts.defaultText)
                }
            }
            .wrapInButton {
                if(isApplicable){
                    showPopup = true
                }
            }
            .padding(CustomPadding.padding)
        }
        .frame(height: Dimensions.defaultRowHeight)
        .background(.dWhite)
        .popover(isPresented: $showPopup){
            Picker("", selection: $selectedText) {
                ForEach(list, id: \.self) { item in
                    Text("\(item)")
                            }
                        }
                        .pickerStyle(.wheel)
        }
        .onAppear(){
            if(showFirst && !list.isEmpty){
                selectedText = list[0]
            }
        }
    }
}

#Preview {
    CustomPopoverPicker(checklistNumber: 1, list: [AppTexts.sampleVeryLargeText.uppercased(), "Shubham Tiwari"], isIcon: true)
}
