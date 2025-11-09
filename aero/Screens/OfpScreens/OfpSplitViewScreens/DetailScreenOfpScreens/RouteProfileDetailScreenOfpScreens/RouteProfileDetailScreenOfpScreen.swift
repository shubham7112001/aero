//
//  RouteProfileDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct RouteProfileDetailScreenOfpScreen: View {
    var body: some View {
        
        
        ZStack{
            Color(.veryLightGrey)
            VStack(spacing : 0){
                HeadingTextNavigationSplitView(text: AppTexts.routeProfile)
                ScrollView{
                    
                    sectionSpacing()
                    
                    CapitalizedTextWithImage(text: AppTexts.routeProfile, image: .copyButton)
                    
                    TextDividerTextVstack(upperText: AppTexts.mock1DataRouteProfileOfpScreen, lowerText: AppTexts.mock2DataRouteProfileOfpScreen)
                    
                    itemSpacing()
                    
                    DividerWithActionsVstack(
                        actions: [
                            TextTextHStack(leftText: AppTexts.climbProfile, rightText: "260/M.78",leftOpacity: true,rightOpacity: true).toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.cruiseProfile, rightText: "M.80",leftOpacity: true,rightOpacity: true).toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.descendProfile, rightText: "M.80/270",leftOpacity: true,rightOpacity: true).toAnyView(),
                        ]
                    )
                    
                    itemSpacing()
                    
                    DividerWithActionsVstack(
                        actions: [
                            TextTextHStack(leftText: AppTexts.routeDistance, rightText: "3992 NM",leftOpacity: true,rightOpacity: true).toAnyView(),
                            
                            TextTextHStack(leftText:AppTexts.greatCircleRatioDistance, rightText: "1.18 / 3371 NM",leftOpacity: true,rightOpacity: true).toAnyView()
                        ]
                    )
                    
                    itemSpacing()
                    
                    CapitalizedTextHalfOpacity(text: AppTexts.routeAverages)
                    
                    CustomHeightSpacer(height: Dimensions.defaultPadding)
                    
                    DividerWithActionsVstack(
                        actions: [
                            TextTextHStack(leftText: AppTexts.routeFL, rightText: "FL 430",leftOpacity: true,rightOpacity: true).toAnyView(),
                            
                            
                            TextTextIconHStack(leftText: AppTexts.routeFLMinMax, rightText: "FL 110 / 430FL 110 / 430").toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.routeTT, rightText: "116°",leftOpacity: true,rightOpacity: true).toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.windComponent, rightText: "TAIL 16 kt",leftOpacity: true,rightOpacity: true).toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.temperatureTOC, rightText: "0 °C",leftOpacity: true,rightOpacity: true).toAnyView()
                            
                        ]
                    )
                    
                    
                    
                    Spacer()
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    RouteProfileDetailScreenOfpScreen()
}
