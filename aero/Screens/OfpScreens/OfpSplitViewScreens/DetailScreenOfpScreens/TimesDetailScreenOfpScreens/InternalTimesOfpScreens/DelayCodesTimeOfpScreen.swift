//
//  DelayCodesTimeOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/12/24.
//

import SwiftUI

struct DelayCodesTimeOfpScreen: View {
    @ObservedObject var timesViewModel: TimesOfpViewModel
    
    var body: some View {
        DetailNavigationSplitView(heading: "Delay codes", leadingActions: [
            Text("Times")
                .foregroundStyle(.dWhite)
                .toAnyView()
        ]){
            
            Picker("", selection: $timesViewModel.selected) {
                Text("Basic").tag(0)
                Text("Extended").tag(1)
            }
            .frame(width: Dimensions.navigationSplitViewDetailWidth / 3)
            .pickerStyle(.segmented)
            
            
            ForEach(Array(DelayCodes.delayCodeData.enumerated()), id: \.offset) { index, delayCode in
                
                VStack(spacing: 0){
                    if let value = DelayCodes.delayCodeMap[index] {
                        CapitalizedTextHalfOpacity(text: value)
                            .padding(CustomPadding.tlbr(t: Dimensions.spaceBwItems, b: CustomPadding.horizontal / 2))
                    }
                    
                    VStack(spacing : 0){
                        DelayCodeView(model: DelayCodes.delayCodeData[index], check: $timesViewModel.basicArray[index], extended: $timesViewModel.extendedArray[index],selected: $timesViewModel.selected, width: Dimensions.navigationSplitViewDetailWidth, onTap: {
                            onTap(index)
                        })
                        
                        
                        if(index != DelayCodes.delayCodeData.count - 1){ Divider().padding(CustomPadding.lPadding)
                        }
                    }
                    .background(.dWhite)
                    
                }
            }
            
            sectionSpacing()
        }
        .onChange(of: timesViewModel.selected){
            if(timesViewModel.selected == 0){
                if(!timesViewModel.extendedArray.allSatisfy{$0 == nil}){
                    timesViewModel.showAlert = true
                }
            }else{
                if(!timesViewModel.basicArray.allSatisfy{$0 == false}){
                    timesViewModel.showAlert = true
                }
            }
        }
        .alert("Changed entry type", isPresented: $timesViewModel.showAlert){
            Button("Cancel", role: .cancel){
                timesViewModel.selected = timesViewModel.selected == 0 ? 1 : 0
            }
            Button("Ok"){
                if(timesViewModel.selected == 0){
                    timesViewModel.extendedArray = Array(repeating: nil, count: 143)
                }else{
                    timesViewModel.basicArray = Array(repeating: false, count: 143)
                }
                
            }
        }message: {
            Text("The selected delay codes will be lost. Do you want to continue?")
        }
    }
    
    private func onTap(_ index : Int){
        if(timesViewModel.selected == 0){
            timesViewModel.basicArray[index] = !timesViewModel.basicArray[index]
        }
    }
}

#Preview {
    DelayCodesTimeOfpScreen(timesViewModel: TimesOfpViewModel())
}
