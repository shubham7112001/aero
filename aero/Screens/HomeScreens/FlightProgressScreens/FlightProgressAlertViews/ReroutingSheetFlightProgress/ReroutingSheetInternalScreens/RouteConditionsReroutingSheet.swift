//
//  RouteCoordinatesReroutingSheet.swift
//  taillog
//
//  Created by Shubham Tiwari on 11/12/24.
//

import SwiftUI

class RouteConditionsViewModel: ObservableObject{
    @Published var windDirection = 0
    @Published var windVelocity = 0
    @Published var trueAirSpeed = 0
    @Published var fuelFlow = 0
}

struct RouteConditionsReroutingSheet: View {
    @EnvironmentObject var reroutingViewModel : ReroutingRoutesViewModel
    @StateObject var viewModel : RouteConditionsViewModel = RouteConditionsViewModel()
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack(spacing: 0){
                VStack{
                    itemSpacing()
                    SheetHeadingView(heading: "Route conditions", cancelText: "Rerouting", cancelFunction: {
                        reroutingViewModel.currentReroutes = .mainPage
                    }, isLeftIconEnable: true)
                }
                .frame(height: 70)
                .background(Color.white.opacity(0.9))
                
                Divider()
                
                ScrollView{
                    VStack{
                        itemSpacing()
                        VStack(spacing: 0){
                            NumberWithFieldHStack(text: "Wind Direction", input: $viewModel.windDirection, suffixText: AppTexts.degreeSymbol, suffixTextOpacity: true)
                            Divider().padding(CustomPadding.lPadding)
                            NumberWithFieldHStack(text: "Wind velocity", input: $viewModel.windVelocity, suffixText: "kt", suffixTextOpacity: true)
                            Divider().padding(CustomPadding.lPadding)
                            NumberWithFieldHStack(text: "True airspeed", input: $viewModel.trueAirSpeed, suffixText: "kt", suffixTextOpacity: true)
                            Divider().padding(CustomPadding.lPadding)
                            NumberWithFieldHStack(text: "Fuel flow", input: $viewModel.fuelFlow, suffixText:  "lb/h", suffixTextOpacity: true)
                        }
                        .background(.dWhite)
                    }
                }
                Spacer()
            }
        }
        .frame(width: Dimensions.customSheetWidth, height: Dimensions.customSheetHeight)
    }
}



#Preview {
    RouteConditionsReroutingSheet()
}
