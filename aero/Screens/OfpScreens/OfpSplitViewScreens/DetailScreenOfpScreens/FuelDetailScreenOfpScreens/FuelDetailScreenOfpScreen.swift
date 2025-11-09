//
//  FuelDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct FuelDetailScreenOfpScreen: View {
    @StateObject var viewModel: FuelOfpViewModel = FuelOfpViewModel()
    var body: some View {
        NavigationStack{
            DetailNavigationSplitView(heading: AppTexts.fuel){
                
                NavigationLink{
                    RefuellingFuelOfpScreen(fuelOfpViewModel: viewModel)
                }label:{
                    IconTextHStack(text: AppTexts.refuelling).background()
                }
                .accentColor(AppColors.navAccentColor)
                
                itemSpacing()
                
                Picker("", selection: $viewModel.wvSelectedPicker){
                    Text("Weight").tag(0)
                    Text("Volume").tag(1)
                }
                .pickerStyle(.segmented)
                .frame(width: Dimensions.navigationSplitViewDetailWidth / 3)
                
                itemSpacing()
                
                NavigationLink{
                    PlannedFuelOfpScreen(fuelViewModel: viewModel)
                }label:{
                    IconTextHStack(text: "Planned fuel").background()
                }
                .accentColor(AppColors.navAccentColor)
                
                itemSpacing()
                VStack(spacing: 0){
                    
                    DividerWithActionsVstack(actions: [
                        TextWithFieldHStack(text: "Remaining last flight", input: $viewModel.remainingLastFlight, suffixText: viewModel.wvSuffixText).toAnyView(),
                        
                        TextWithFieldHStack(text: "Uplift", input: $viewModel.uplift, suffixText: viewModel.wvSuffixText).toAnyView(),
                        
                        TextWithFieldHStack(text: "Ramp", input: $viewModel.ramp, suffixText: viewModel.wvSuffixText).toAnyView()
                        
                    ])
                    
                    if(viewModel.wvSelectedPicker == 1){
                        VStack(spacing: 0){
                            
                            Divider().padding(CustomPadding.lPadding)
                            
                            TextWithFieldHStack(text: "Ramp (Gallons)", input: $viewModel.ramp, suffixText: "gal")
                            
                        }
                    }
                }
                .background(.dWhite)
                
                itemSpacing()
                
                TextWithFieldHStack(text: "Take-off", input: $viewModel.takeOff, suffixText: viewModel.wvSuffixText)
                
                itemSpacing()
                
                TextTextHStack(leftText: AppTexts.maxHolding, rightText: "00:16 / 586 \(viewModel.wvSuffixText)",leftOpacity: true, rightOpacity: true).background()
                
                SmallParagraphText(text: AppTexts.fuelFlowNote)
                
                itemSpacing()
                
                TextWithFieldHStack(text: "Remaining after flight completion", input: $viewModel.remainingAfterFlightCompletion, suffixText: viewModel.wvSuffixText)
                
                itemSpacing()
                
                NavigationLink{
                    DensityFuelOfpScreen(fuelViewModel: viewModel)
                }label:{
                    TextTextIconHStack(leftText: AppTexts.density, rightText: "0.804 kg/L").background()
                }
                .accentColor(AppColors.navAccentColor)
                
                SmallParagraphText(text: AppTexts.fuelVolumeNote)
                
            }
        }
    }
}

#Preview {
    FuelDetailScreenOfpScreen()
}
