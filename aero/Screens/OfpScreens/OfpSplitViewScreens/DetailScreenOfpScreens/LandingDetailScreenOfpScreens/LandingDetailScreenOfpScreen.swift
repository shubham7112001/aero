//
//  LandingDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct LandingDetailScreenOfpScreen: View {
    @State var input: String = ""
    @StateObject var viewModel: LandingTakeOffViewModel = LandingTakeOffViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.veryLightGrey)
                VStack(spacing : 0){
                    HeadingTextNavigationSplitView(text: AppTexts.landing)
                    
                    ScrollView{
                        sectionSpacing()
                        
                        NavigationLink{
                            PlanningLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Landing")
                        }label:{
                            IconTextHStack(text: AppTexts.planning).background()
                        }
                            .accentColor(AppColors.navAccentColor)
                        
                        itemSpacing()
                        
                        CapitalizedTextHalfOpacity(text: AppTexts.landingConditions)
                        
                        DividerWithActionsVstack(actions: [
                            
                            NavigationLink{
                                RunwayLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Landing")
                            }label:{
                                TextTextIconHStack(leftText: "\(AppTexts.runway) (AP ELEV 138 ft)", rightText: "3292m")
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            NavigationLink{
                                RunwayConditionTakeOffOfpScreen(viewModel: viewModel, backBarText: "Landing")
                            }label:{
                                TextTextIconHStack(leftText: AppTexts.runwayCondition, rightText: "NR/ NR/NR")
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            NavigationLink{
                                FacilitiesLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Landing")
                            }label:{
                            IconTextHStack(text: AppTexts.facilities)
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            
                                
                            NavigationLink{
                                WindLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Landing")
                            }label:{
                            TextTextIconHStack(leftText: AppTexts.wind, rightText: "0 kt")
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            
                            NavigationLink{
                                VisibilityRvrLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Landing")
                            }label:{
                            IconTextHStack(text: AppTexts.visibilityRVR)
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            
                            TextWithFieldHStack(text: AppTexts.ceiling, input: $viewModel.ceiling, suffixText: "ft").toAnyView(),
                            
                            NavigationLink{
                                TemperatureDewpointLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Landing")
                            }label:{
                            IconTextHStack(text: AppTexts.temperatureDewpoint)
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                        
                            TextWithFieldHStack(text: AppTexts.qnh, input: $viewModel.qnh, suffixText: "hPa").toAnyView()
                        ])
                        
                        itemSpacing()
                        
                        CapitalizedTextHalfOpacity(text: "Landing settings")
                        
                        DividerWithActionsVstack(actions: [
                            NavigationLink{
                                WeightMaxLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Landing")
                            }label:{
                            TextTextIconHStack(leftText: "Weight / Max.", rightText: "12334 / 12334 lb", textOpacity : true)
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            
                            ToggleSwitch(text: "Anti-ice").toAnyView(),
                            
                            CustomPopoverPicker(list: flapsSettings, leftText: "Landing flaps").toAnyView(),
                            
                            TextWithFieldHStack(text: "LDTA", input: $input).toAnyView()
                        ])
                    }
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    LandingDetailScreenOfpScreen()
}
