//
//  PlannedFuelDataModelScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 02/01/25.
//

import SwiftUI

struct PlannedFuelDataModelScreen: View {
    @ObservedObject var fuelViewModel: FuelOfpViewModel
    var body: some View {
            VStack(spacing: 0){
                modelView(nil, textColor: .black)
                
                Divider().padding(CustomPadding.lPadding)
                
                ForEach(Array(fuelViewModel.plannedFuelData.enumerated()), id: \.element.id ){index, plannedModel in
                        VStack(spacing: 0){
                            
                            modelView(fuelViewModel.plannedFuelData[index], textColor: index == 2 ? .black : .black.opacity(0.5))
                            
                            if(index != fuelViewModel.plannedFuelData.count - 1){
                                Divider().padding(CustomPadding.lPadding)
                            }
                        }
                }
            }
            .frame(width: Dimensions.navigationSplitViewDetailWidth)
            .background(.dWhite)
    }
    
    private func modelView(_ model: PlannedFuelDataModel?, textColor: Color = .black) -> some View{
        return HStack{
            itemSpacingWidth()
            modelText(model != nil ? model!.fl.toString : "FL", textColor: textColor)
            modelText(model != nil ? "\(model!.wc.toString) kt" : "WC", textColor: textColor)
            modelText(model != nil ? model!.time : "Time", textColor: textColor)
            modelText(model != nil ? "\(model!.fuel.toString) lb" : "Fuel", textColor: textColor)
            modelText(model != nil ? "\(model!.oneTon.toString) lb" : "1 Ton", textColor: textColor)
            modelText(model != nil ? model!.costDiff.toString : "Cost Diff.", textColor: textColor, width: 2 * Dimensions.navigationSplitViewDetailWidth / 7 - 20)
            itemSpacingWidth()
        }
        .frame(height: Dimensions.defaultRowHeight)
    }
    
    private func modelText(_ text: String, textColor: Color = .black, width: CGFloat = Dimensions.navigationSplitViewDetailWidth / 7 - 5) -> some View{
        return CroppedText(text: text, textColor: textColor)
            .frame(width: width)
    }
}

#Preview {
    PlannedFuelDataModelScreen(fuelViewModel: FuelOfpViewModel())
}
