//
//  RegisterFlightFlightProgressScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/09/24.
//

import SwiftUI

struct RegisterFlightFlightProgressView: View {
    @ObservedObject var viewModel : FlightProgressViewModel
    var body: some View {
        VStack(spacing : CustomPadding.defaultPadding * 2){
            Text("Register flight progress")
                .font(AppFonts.defaultText)
                .fontWeight(.bold)
                .padding(CustomPadding.tlbr(t: CustomPadding.defaultPadding * 2))
            
            Text(viewModel.registerFlightProgressLongText)
                .padding(CustomPadding.hPadding)
                .font(AppFonts.smallText)
            
            Text(viewModel.registerFlightProgressSelectedText)
                .font(AppFonts.smallText)
                .fontWeight(.bold)
            
            
            
            HStack {
                FlightProgressDialogImage(imageName: viewModel.registerFlightProgressImg1, label: viewModel.registerFlightProgressImgTxt1, action: viewModel.registerFlightProgressImg1Action)
                FlightProgressDialogImage(imageName: viewModel.registerFlightProgressImg2, label: viewModel.registerFlightProgressImgTxt2, action: viewModel.registerFlightProgressImg2Action)
                FlightProgressDialogImage(imageName: viewModel.registerFlightProgressImg3, label: viewModel.registerFlightProgressImgTxt3, action: viewModel.registerFlightProgressImg3Action)
            }
           
            CustomTextEditor(inputText: $viewModel.registerFlightProgressRemarksInput, height: 100, hintText: "Enter waypoint remarks",isLeftPadding: false, font: AppFonts.defaultText)
            
            CustomHeightSpacer(height: 1)
        }
        .background(.veryLightGrey)
        .frame(width: Dimensions.dialogBoxWidth - 30)
        .roundedCorner(12, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
    }
}

struct FlightProgressDialogImage: View {
    
    let imageName: UIImage
    let label: String
    let action: () -> ()
    
    
    var body: some View {
        VStack(spacing: 0) {
            Image(uiImage: imageName)
                .frame(width: 70, height: 70)
                .scaledToFit()
                .cornerRadius(10)
                .accessibilityLabel(Text(label)) // Optional: Add accessibility label for better UX
            Text(label)
                .font(AppFonts.smallText)
        }
        
        .wrapInButton {
            action()
            CustomDialogManager.shared.dismissDialog()        }
        .disabled(imageName == .abeamInactive || imageName == .directtoInactive)
    }
}

#Preview {
    RegisterFlightFlightProgressView(viewModel: FlightProgressViewModel())
}
