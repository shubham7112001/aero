//
//  WaypointsDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct WaypointsDetailScreenOfpScreen: View {
    @StateObject var waypointsViewModel : WaypointsOfpViewModel = WaypointsOfpViewModel()
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack(spacing : 0){
                HeadingTextNavigationSplitView(text: AppTexts.waypoints)
                ScrollView{
                    sectionSpacing()
                    VStack(spacing : 0){
                        ForEach(0..<20){index in
                            
                            let formattedIndex = String(format: "%02d", index + 1)
                            NavigationLink{
                                ModelInternalWaypointsOfpScreen(waypointsViewModel: waypointsViewModel)
                            }label:{
                                VStack(spacing : 0){
                                    ModelWaypointsDetailOfpScreen(upperText: "\(formattedIndex) : GCFV", lowerText: "DEPARTURE AIRPORT",
                                                                  textColor: index > 10 ? Color.blue : Color.black)
                                    HorizontalDividerDetailScreenNavigationSplitView()
                                }
                            }
                        }
                    }
                    .background(.white)
                    Spacer()
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    WaypointsDetailScreenOfpScreen()
}
