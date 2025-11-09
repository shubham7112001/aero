//
//  RefuellingFuelOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/12/24.
//

import SwiftUI

struct RefuellingFuelModelOfpScreen: View {
    
    @ObservedObject var viewModel: FuelRefuellingOfpViewModel
    
    var body: some View {
        VStack(spacing: 0) {
                    
            itemSpacing()
            
            DividerWithActionsVstack(actions: [
                ImageSelectionRow(text: "Receipt", selectedImage: $viewModel.selectedImage).toAnyView(),
                TextWithFieldHStack(text: "Receipt No.", input: $viewModel.receiptNo, keyboardType: UIKeyboardType.numberPad).toAnyView()
            ])
            
            itemSpacing()
            
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: "Volume", input: $viewModel.volumeLt, suffixText: "L", suffixTextOpacity: true).toAnyView(),
                TextWithFieldHStack(text: "Volume (Gallons)", input: $viewModel.volumeGal, suffixText: "gal", suffixTextOpacity: true).toAnyView(),
                TextWithFieldHStack(text: "Weight", input: $viewModel.weight, suffixText: "lb", suffixTextOpacity: true).toAnyView()
            ])
            
            itemSpacing()
            
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: "SAF %", input: $viewModel.safPercentage, suffixText: "%", keyboardType: UIKeyboardType.numberPad, suffixTextOpacity: true).toAnyView(),
            ])
            
            itemSpacing()
            
            DividerWithActionsVstack(actions: [
                TextWithFieldHStack(text: "Density", input: $viewModel.densityKgLit, suffixText: "kg/L", suffixTextOpacity: true).toAnyView(),
                TextWithFieldHStack(text: "Density (lb/gal)", input: $viewModel.densityLbGal, suffixText: "lb/gal", suffixTextOpacity: true).toAnyView()
            ])
            
            VStack(spacing: 0) {
                itemSpacing()
                CapitalizedTextHalfOpacity(text: "Fuel Supplier")
                CustomHeightSpacer(height: Dimensions.defaultPadding)
                
                VStack(spacing: 0) {
                    ForEach(viewModel.suppliers.indices, id: \.self) { index in
                        Button {
                            if viewModel.selectedSupplier == viewModel.suppliers[index] {
                                viewModel.selectedSupplier = nil
                            } else {
                                viewModel.selectedSupplier = viewModel.suppliers[index]
                            }
                        } label: {
                            VStack(spacing: 0) {
                                TextWithCheckMark(text: viewModel.suppliers[index], isCheckmark: viewModel.selectedSupplier == viewModel.suppliers[index])
                                Divider().padding(CustomPadding.lPadding)
                            }
                        }
                    }
                    
                    HStack{
                        Text("Other")
                            .foregroundStyle(.blue)
                            .font(AppFonts.defaultText)
                        
                        TextField("",text:  $viewModel.inputSupplier)
                        
                        if(!viewModel.inputSupplier.isEmpty){
                            IconImage(content: .systemImage(SFIcons.checkmark),color: .mainBlue)
                        }
                    }
                    .padding(CustomPadding.hPadding)
                    .frame(height: Dimensions.defaultRowHeight)
                }
                    .background(.dWhite)
            }
        }
    }
}

#Preview {
    RefuellingFuelModelOfpScreen(viewModel: FuelRefuellingOfpViewModel())
}
