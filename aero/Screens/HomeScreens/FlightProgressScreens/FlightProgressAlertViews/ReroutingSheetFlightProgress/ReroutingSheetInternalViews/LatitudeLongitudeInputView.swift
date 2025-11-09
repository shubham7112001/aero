//
//  LatitudeLongitudeInputView.swift
//  taillog
//
//  Created by Shubham Tiwari on 11/12/24.
//

import SwiftUI

struct LatitudeLongitudeInputView: View {
    @ObservedObject var viewModel: ReroutingSheetFlightProgressViewModel

    var body: some View {
        VStack(alignment: .leading) {
            CapitalizedTextHalfOpacity(text: "Latitude & Longitude")
            HStack {
                HStack(alignment: .top) {
                    Text("LAT").font(AppFonts.largeText).fontWeight(.regular)
                    Text("\(viewModel.latModel.direction) \(String(format: "%02d",viewModel.latModel.degree)):\(viewModel.latModel.minute).\(viewModel.latModel.second)")
                        .opacity(AppConstants.defaultOpacity)
                }
                .wrapInButton {
                    viewModel.showLatPopup = true
                }
                .popover(isPresented: $viewModel.showLatPopup) {
                    LatitudePicker(model: $viewModel.latModel)
                        .frame(width: Dimensions.flexSheetWidth * 0.5, height: Dimensions.flexSheetWidth * 0.5)
                }
                .frame(width: Dimensions.flexSheetWidth * 0.2)
                .padding(CustomPadding.hv(h: CustomPadding.horizontal / 2, v: CustomPadding.vertical))
                .background(.dWhite)
                .cornerRadius(5)

                HStack(alignment: .top) {
                    Text("LON").font(AppFonts.largeText).fontWeight(.regular)
                    Text("\(viewModel.lonModel.direction) \(String(format: "%03d", viewModel.lonModel.degree)):\(viewModel.lonModel.minute).\(viewModel.lonModel.second)")
                        .opacity(AppConstants.defaultOpacity)
                }
                .wrapInButton {
                    viewModel.showLonPopup = true
                }
                .popover(isPresented: $viewModel.showLonPopup) {
                    LongitudePicker(model: $viewModel.lonModel)
                        .frame(width: Dimensions.flexSheetWidth * 0.5, height: Dimensions.flexSheetWidth * 0.5)
                }
                .frame(width: Dimensions.flexSheetWidth * 0.25)
                .padding(CustomPadding.hv(h: CustomPadding.defaultPadding / 2, v: CustomPadding.defaultPadding))
                .background(.dWhite)
                .cornerRadius(5)

                VStack {
                    Text("Add")
                        .foregroundStyle(.dWhite)
                        .font(AppFonts.largeText)
                        .padding(CustomPadding.hv(h: CustomPadding.horizontal / 3, v: CustomPadding.defaultPadding))
                        .wrapInButton {
                            viewModel.insertInLatLonList()
                        }
                }
                .background(viewModel.icaoIdxList.count < 3 ? .main : .gray)
                .cornerRadius(5)
                .disabled(viewModel.icaoIdxList.count >= 3)
            }
            .padding(CustomPadding.lPadding)
        }
        .frame(width: Dimensions.flexSheetWidth * 0.7)
    }
    
}

#Preview {
    LatitudeLongitudeInputView(viewModel: ReroutingSheetFlightProgressViewModel())
}
