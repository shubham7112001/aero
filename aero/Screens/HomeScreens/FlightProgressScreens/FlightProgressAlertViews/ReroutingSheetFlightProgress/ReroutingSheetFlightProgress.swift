//
//  ReroutingSheetFlightProgress.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/09/24.
//

import SwiftUI

struct ReroutingSheetFlightProgress: View {
    @EnvironmentObject var routes : ReroutingRoutesViewModel
    @StateObject var viewModel: ReroutingSheetFlightProgressViewModel = ReroutingSheetFlightProgressViewModel()
    @Binding var showSheet: Bool

    var body: some View {
        ZStack {
            Color(.veryLightGrey)
            VStack {
                SheetHeadingView(heading: "Rerouting", functionText: "Activate", function: {
                    viewModel.showActivateAlert()
                }, cancelFunction: {
                    removeSheet()
                })

                sectionSpacing()
                VStack {
                    VStack {
                        HStack {
                            VStack {
                                HStack(alignment: .top) {
                                    ScrollView(.vertical) {
                                        Text(viewModel.resultant)
                                            .font(AppFonts.largeText)
                                    }
                                    Spacer()
                                }
                                .padding(CustomPadding.lPadding)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                Spacer()
                            }

                            VStack {
                                Image(systemName: SFIcons.backTextField)
                                    .font(AppFonts.largeText)
                                    .foregroundStyle(.blue)
                                    .wrapInButton {
                                        viewModel.removeLastLatLonList()
                                    }
                                Spacer()
                            }
                            .padding(CustomPadding.padding)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 75, alignment: .topLeading)
                        .padding(CustomPadding.tPadding)

                        Divider()

                        TextTextIconHStack(leftText: "Reference waypoint", rightText: "GDV", height: Dimensions.rowHeight)
                            .wrapInButton {
                                routes.currentReroutes = .referenceWaypoint
                            }

                        Divider()

                        TextTextIconHStack(leftText: "Route conditions", rightText: "W/V 297/9, TAS 264, FF 828", height: Dimensions.rowHeight)
                            .wrapInButton {
                                routes.currentReroutes = .routeConditions
                            }
                    }
                }
                .background(.dWhite)

                LeftColoredText(text: "NOTICE: The filed ATC flight plan will not be amended.", color: .black, bgColor: .clear)
                    .opacity(AppConstants.defaultOpacity)

                sectionSpacing()

                Picker("", selection: $viewModel.selectedSegment) {
                    Text("Waypoints").tag(0)
                    Text("Airport").tag(1)
                }
                .frame(width: Dimensions.screenWidth / 3)
                .pickerStyle(.segmented)
                .disabled(viewModel.icaoIdxList.count >= 3)

                itemSpacing()

                HStack {
                    LatitudeLongitudeInputView(viewModel: viewModel)
                    if viewModel.selectedSegment == 1 && viewModel.icaoIdxList.count < 3 {
                        ICAOInputView(viewModel: viewModel)
                    }
                    Spacer()
                }

                itemSpacing()

                CapitalizedTextHalfOpacity(text: "Company \((viewModel.selectedSegment == 1 && viewModel.icaoIdxList.count < 3) ?  "airports" : "waypoints")")
                Spacer()
            }
        }
        .frame(width: Dimensions.flexSheetWidth, height: Dimensions.flexSheetHeight)
        .ignoresSafeArea()
        .alert("", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.alertMessage)
        }
        .alert("Activate rerouting", isPresented: $viewModel.activateAlert) {
            Button("Cancel", role: .cancel) {}
            Button("OK") {
                removeSheet()
            }
        } message: {
            Text(viewModel.activateAlertMessage)
        }
    }
    
    private func removeSheet(){
        if(!showSheet){
            showSheet = true
        }
            showSheet = false
    }
}

#Preview {
    ReroutingSheetFlightProgress(showSheet: .constant(true))
}
