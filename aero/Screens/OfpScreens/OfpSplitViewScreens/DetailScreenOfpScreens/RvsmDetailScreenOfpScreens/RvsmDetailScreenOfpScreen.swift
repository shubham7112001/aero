//
//  RvsmDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct RvsmDetailScreenOfpScreen: View {
    @StateObject var viewModel: RvsmOfpViewModel = RvsmOfpViewModel()
    var body: some View {
        
        DetailNavigationSplitView(heading: "RVSM"){
            
            PopupSelectionRowView(viewModel: PopupSelectionRowViewModel(leftText: "Check type", selected: $viewModel.selectedRvsmCheckTypes, dataList: viewModel.checkTypeList))
            
            itemSpacing()
                
            VStack(spacing : 0){
                CapitalizedTextHalfOpacity(text: AppTexts.beforeTakeOffCap)
                Divider()
                VStack(spacing: 0){
                    TextWithFieldHStack(text: AppTexts.takeOffElevation, input: $viewModel.takeOffElevation, suffixText: "ft", isDisabled: viewModel.isDisabled)
                    
                    Divider().padding(CustomPadding.lPadding)
                    
                    ModelViewRvsmDetailScreenOfpScreen(viewModel: RvsmInternalViewModel(capitalText: "", isDisabled: viewModel.isDisabled))
                }
                .background(.dWhite)
            }
            
            itemSpacing()
            
            VStack(spacing : Dimensions.spaceBwItems){
                ForEach(0..<10){index in
                    var vm = RvsmInternalViewModel(capitalText: "Heading text", isDisabled: viewModel.isDisabled)
                    
                    ModelViewRvsmDetailScreenOfpScreen(viewModel: vm)
                }
            }
            
        }
    }
}

#Preview {
    RvsmDetailScreenOfpScreen()
}
