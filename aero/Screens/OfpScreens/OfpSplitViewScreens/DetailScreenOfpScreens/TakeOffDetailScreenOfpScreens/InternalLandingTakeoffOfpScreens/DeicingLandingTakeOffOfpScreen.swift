//
//  DeicingTakeOffOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/12/24.
//

import SwiftUI

struct DeicingLandingTakeOffOfpScreen: View {
    @ObservedObject var viewModel: LandingTakeOffViewModel
    let backBarText: String
    var body: some View {
        DetailNavigationSplitView(leftText: backBarText, heading: "Deicing"){
            DividerWithActionsVstack(actions: [
                TextTextHStack(leftText: "Holdover time", rightText: viewModel.holdoverTime != nil ? DateTimeFunctions.onlyTimeReadable(viewModel.holdoverTime!) : "",rightOpacity: true)
                    .wrapInButton {
                        viewModel.enableHoldoverPopup()
                    }
                    .popover(isPresented: $viewModel.showHoldoverPopup, content: {
                        
                        ShowTimePicker(timePicker: $viewModel.holdoverTime)
                        
                    })
                    .toAnyView(),
                
                
                TextTextHStack(leftText: "Start time", rightText: viewModel.startTime != nil ? "\(DateTimeFunctions.dateTimeReadable(viewModel.startTime!)) Z" : "",rightOpacity: true)
                    .wrapInButton {
                        viewModel.enableStartTimePopup()
                    }
                    .popover(isPresented: $viewModel.showStartTimePopup, content: {
                        DatePicker("",selection: Binding(
                            get: { viewModel.startTime ?? Date() },
                            set: { viewModel.startTime = $0 }
                        ), in: ...Date.now, displayedComponents: [.date,.hourAndMinute])
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                    })
                    .toAnyView(),
                TextTextHStack(leftText: "End time",
                               rightText: (viewModel.holdoverTime != nil && viewModel.startTime != nil) ? "\(DateTimeFunctions.dateTimeReadable(DateTimeFunctions.addTime(timeDate: viewModel.holdoverTime!, dateWithDate: viewModel.startTime!))) Z" : "",
                               leftOpacity: true,
                               rightOpacity: true)
                .toAnyView(),
                
            ])
            
            itemSpacing()
            
            CapitalizedTextHalfOpacity(text: "receipt")
            
            DividerWithActionsVstack(actions: [
                ImageSelectionRow(text: "Receipt", selectedImage: $viewModel.selectedImage).toAnyView(),
            
                TextWithFieldHStack(text: "Receipt no.", input: $viewModel.receiptNo,font: AppFonts.defaultText, height: Dimensions.defaultRowHeight + 6,keyboardType: .numberPad)
                    .toAnyView(),
                
                TextWithFieldHStack(text: "Supplier", input: $viewModel.receiptSupplier,font: AppFonts.defaultText, height: Dimensions.defaultRowHeight + 6,keyboardType: .numberPad)
                    .toAnyView()
                
            ])
        }
    }
}

#Preview {
    DeicingLandingTakeOffOfpScreen(viewModel: LandingTakeOffViewModel(), backBarText: "backBarText")
}
