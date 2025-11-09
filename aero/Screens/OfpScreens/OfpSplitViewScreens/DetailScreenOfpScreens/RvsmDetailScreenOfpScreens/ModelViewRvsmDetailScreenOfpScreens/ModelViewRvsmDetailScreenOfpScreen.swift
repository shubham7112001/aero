//
//  ModelViewRvsmDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 12/07/24.
//

import SwiftUI

struct ModelViewRvsmDetailScreenOfpScreen: View {
    
    @ObservedObject var viewModel: RvsmInternalViewModel
    var body: some View {
        VStack(spacing : 0){
            if(!viewModel.capitalText.isEmpty){
                CapitalizedTextHalfOpacity(text: viewModel.capitalText)
                Divider()
            }
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: AppTexts.altsel, input: $viewModel.altSel, suffixText: "ft", isDisabled: viewModel.isDisabled).toAnyView(),
                TextWithFieldHStack(text: AppTexts.pri1, input: $viewModel.pri1, suffixText: "ft", isDisabled: viewModel.isDisabled).toAnyView(),
                TextWithFieldHStack(text: AppTexts.pri2, input: $viewModel.pri2, suffixText: "ft", isDisabled: viewModel.isDisabled).toAnyView(),
                TextWithFieldHStack(text: AppTexts.sbyalt, input: $viewModel.sbyAlt, suffixText: "ft", isDisabled: viewModel.isDisabled).toAnyView(),
            ])
            Divider()
        }
    }
}

#Preview {
    ModelViewRvsmDetailScreenOfpScreen(viewModel: RvsmInternalViewModel())
}
