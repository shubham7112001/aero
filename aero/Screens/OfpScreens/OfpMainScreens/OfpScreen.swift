//
//  OfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct OfpScreen: View {

    @State var appBarText : String = "MMD5237 : ESSA-VABB : 11 JUL 2024 20:30 Z"
    @State var selected = PrimaryScreenOfpScreenSelection.checkRemarks

    @State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    @State private var preferredCompactColumn = NavigationSplitViewColumn.detail
    
    var body: some View {
            VStack(spacing: 0){
                AppBarOfpScreen(text: $appBarText)
                HStack {
                    NavigationSplitView(
                        columnVisibility: $columnVisibility,
                        preferredCompactColumn: $preferredCompactColumn,
                        

                        sidebar: {
                                PrimaryScreenOfpScreens(selected: $selected)
                                    .toolbar(removing: ToolbarDefaultItemKind.sidebarToggle)
                                    .navigationSplitViewColumnWidth(Dimensions.navigationSplitViewPrimaryWidth)
                        },

                        detail: {
                            switch selected {
                                case .checkRemarks:
                                    CheckRemarksDetailScreenOfpScreen()
                                case .forms:
                                    FormsDetailScreenOfpScreen()
                                case .documentsMessages:
                                    DocumentsMessagesDetailScreenOfpScreen()
                                case .mandatoryData:
                                    MandatoryDataDetailScreenOfpScreen()
                                case .notam:
                                    NotamDetailScreenOfpScreen()
                                case .weather:
                                    WeatherDetailScreenOfpScreen()
                                case .flightCrew:
                                    FlightCrewDetailScreenOfpScreen()
                                case .times:
                                    TimesDetailScreenOfpScreen()
                                case .waypoints:
                                    WaypointsDetailScreenOfpScreen()
                                case .alternates:
                                    AlternatesDetailScreenOfpScreen()
                                case .routeProfile:
                                    RouteProfileDetailScreenOfpScreen()
                                case .rvsm:
                                    RvsmDetailScreenOfpScreen()
                                case .takeOff:
                                    TakeOffDetailScreenOfpScreen()
                                case .landing:
                                    LandingDetailScreenOfpScreen()
                                case .fuel:
                                    FuelDetailScreenOfpScreen()
                                case .performanceReports:
                                    PerformanceReportDetailScreenOfpScreen()
                                case .loadSummary:
                                    LoadSummaryDetailScreenOfpScreen()
                                }
                        }
                    )
                    .navigationSplitViewStyle(.balanced)
                }
            }
            .navigationBarBackButtonHidden()
            .ignoresSafeArea()
    }

}

struct OfpScreen_Previews: PreviewProvider {
    static var previews: some View {
        OfpScreen()
    }
}
