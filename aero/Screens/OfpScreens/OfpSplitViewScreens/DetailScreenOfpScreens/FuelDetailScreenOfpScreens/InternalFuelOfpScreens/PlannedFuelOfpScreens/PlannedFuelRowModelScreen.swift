//
//  PlannedFuelRowModelScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 02/01/25.
//

import SwiftUI

struct PlannedFuelRowModelScreen: View {
    @ObservedObject var viewModel: FuelOfpViewModel
    let index: Int
    var body: some View {
        DetailNavigationSplitView(leftText: AppTexts.fuel, heading: viewModel.plannedFuelList[index].heading){
            
            if(!viewModel.plannedFuelList[index].alternates.isEmpty){
                
                TextTextHStack(leftText: viewModel.plannedFuelList[index].heading, rightText: viewModel.plannedFuelList[index].alternates)
            
                itemSpacing()
                
            }
            
            DividerWithActionsVstack(actions: [
                CustomTimePicker(time: $viewModel.plannedFuelList[index].time, text: "Time", showAmPm: true).toAnyView(),
                
                TextWithFieldHStack(text: "Weight", input: $viewModel.plannedFuelList[index].weight, suffixText: "lb").toAnyView(),
                
                TextWithFieldHStack(text: "Volume", input: $viewModel.plannedFuelList[index].volume, suffixText: "L").toAnyView()
                
            ])
            
            SmallParagraphText(text: viewModel.plannedFuelList[index].paragraphText)
            
            itemSpacing()
            
            DividerWithActionsVstack(actions: [
                
                TextWithFieldHStack(text: "Fuel flow", input: $viewModel.plannedFuelList[index].fuelFlow, suffixText: "lb/h").toAnyView(),
                
                TextWithFieldHStack(text: "Fuel Type", input: $viewModel.plannedFuelList[index].fuelType, suffixText: "kg/L").toAnyView()
                
            ])
            
            itemSpacing()
            
            CapitalizedTextHalfOpacity(text: "Reason for \(viewModel.plannedFuelList[index].heading) fuel")
            
            MultipleItemSelection(list: viewModel.plannedFuelList[index].fuelReasons)
            
            
        }
    }
}

#Preview {
    PlannedFuelRowModelScreen(viewModel: FuelOfpViewModel(), index: 0)
}
