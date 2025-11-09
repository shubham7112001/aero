//
//  MainReroutingSheetFlightProgress.swift
//  taillog
//
//  Created by Shubham Tiwari on 11/12/24.
//

import SwiftUI

enum Reroutes{
    case mainPage
    case referenceWaypoint
    case routeConditions
}

class ReroutingRoutesViewModel : ObservableObject {
    @Published var currentReroutes : Reroutes = .mainPage
}

struct MainReroutingSheetFlightProgress: View {
    @StateObject var currentReroutes : ReroutingRoutesViewModel = ReroutingRoutesViewModel()
    @Binding var showSheet : Bool
    var body: some View {
        ZStack{
            ReroutingSheetFlightProgress(showSheet: $showSheet)
                .environmentObject(currentReroutes)
                .offset(x: currentReroutes.currentReroutes == .mainPage ? 0 : -150)
                .zIndex(0)
            
            if currentReroutes.currentReroutes == .referenceWaypoint {
                ReferenceWaypointReroutingSheet()
                    .environmentObject(currentReroutes)
                    .transition(.move(edge: .trailing))
                    .zIndex(1)
            }
            
            if currentReroutes.currentReroutes == .routeConditions {
                RouteConditionsReroutingSheet()
                    .environmentObject(currentReroutes)
                    .transition(.move(edge: .trailing))
                    .zIndex(1)
            }
        }
        .frame(width: Dimensions.customSheetWidth, height: Dimensions.customSheetHeight)
        .animation(.easeIn(duration: 0.2), value: currentReroutes.currentReroutes)
    }
}

#Preview {
    MainReroutingSheetFlightProgress(showSheet: .constant(false))
}
