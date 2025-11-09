//
//  TopHomeScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/12/24.
//

import SwiftUI

struct TopHomeScreen: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    var body: some View {
        ZStack{
            Group {
                switch homeScreenViewModel.currScreen {
                    case .avlFlightPlan:
                        AvailableFlightPlanScreen(homeScreenViewModel: homeScreenViewModel)
                    case .flightProgress:
                        FlightProgressScreen(homeScreenViewModel: homeScreenViewModel)
                    case .completedFlightLog:
                        CompletedFlightLogScreen(homeScreenViewModel: homeScreenViewModel)
                    case .companyDoc:
                        CompanyDocumentsScreen(homeScreenViewModel: homeScreenViewModel)
                    case .securitySealLog:
                        SecuritySealLogScreen(homeScreenViewModel: homeScreenViewModel)
                    case .configuration:
                        ConfigurationScreen(homeScreenViewModel: homeScreenViewModel)
                }
            }
            .padding(.top, Dimensions.statusBarHeight)
            .offset(x: homeScreenViewModel.isOffset ? homeScreenViewModel.offset : 0)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TopHomeScreen(homeScreenViewModel: HomeScreenViewModel())
}
