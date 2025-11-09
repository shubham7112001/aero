//
//  TakeOffDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI
let flapsSettings = [
    "Flaps setting 0", "Flaps setting 1", "Flaps setting 2", "Flaps setting 3", "Flaps setting 4",
    "Flaps setting : 0°", "Flaps setting : 1°", "Flaps setting : 2°", "Flaps setting : 3°", "Flaps setting : 4°",
    "Flaps setting : 5°", "Flaps setting : 6°", "Flaps setting : 7°", "Flaps setting : 8°", "Flaps setting : 9°",
    "Flaps setting : 10°", "Flaps setting : 11°", "Flaps setting : 12°", "Flaps setting : 13°", "Flaps setting : 14°",
    "Flaps setting : 15°", "Flaps setting : 16°", "Flaps setting : 17°", "Flaps setting : 18°", "Flaps setting : 19°",
    "Flaps setting : 20°", "Flaps setting : 21°", "Flaps setting : 22°", "Flaps setting : 23°", "Flaps setting : 24°",
    "Flaps setting : 25°", "Flaps setting : 26°", "Flaps setting : 27°", "Flaps setting : 28°", "Flaps setting : 29°",
    "Flaps setting : 30°", "Flaps setting : 31°", "Flaps setting : 32°", "Flaps setting : 33°", "Flaps setting : 34°",
    "Flaps setting : 35°", "Flaps setting : 36°", "Flaps setting : 37°", "Flaps setting : 38°", "Flaps setting : 39°",
    "Flaps setting : 40°"
]

struct TakeOffDetailScreenOfpScreen: View {
    @State var input: String = ""
    @StateObject var viewModel: LandingTakeOffViewModel = LandingTakeOffViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.veryLightGrey)
                VStack(spacing : 0){
                    HeadingTextNavigationSplitView(text: AppTexts.takeOff)
                    
                    ScrollView{
                        sectionSpacing()
                        
                        LeftColoredText(text: AppTexts.takeOffPerformance, color: .blue)
                        
                        itemSpacing()
                        
                        
                        NavigationLink{
                            PlanningLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Take-off")
                        }label:{
                            IconTextHStack(text: AppTexts.planning).background()
                        }
                        .accentColor(AppColors.navAccentColor)
                        
                        
                        itemSpacing()
                        
                        CapitalizedTextHalfOpacity(text: AppTexts.takeOffConditions)
                        
                        DividerWithActionsVstack(actions: [
                            
                            NavigationLink{
                                RunwayLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Take-off")
                            }label:{
                                TextTextIconHStack(leftText: "\(AppTexts.runway) (AP ELEV 138 ft)", rightText: "3292m")
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            NavigationLink{
                                RunwayConditionTakeOffOfpScreen(viewModel: viewModel, backBarText: "Take-off")
                            }label:{
                                TextTextIconHStack(leftText: AppTexts.runwayCondition, rightText: "NR/ NR/NR")
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                                
                            NavigationLink{
                                FacilitiesLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Take-off")
                            }label:{
                                IconTextHStack(text: AppTexts.facilities)
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                                
                            NavigationLink{
                                WindLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Take-off")
                            }label:{
                                TextTextIconHStack(leftText: AppTexts.wind, rightText: "0 kt")
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                                
                            NavigationLink{
                                VisibilityRvrLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Take-off")
                            }label:{
                                IconTextHStack(text: AppTexts.visibilityRVR)
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            TextWithFieldHStack(text: AppTexts.ceiling, input: $viewModel.ceiling, suffixText: "ft").toAnyView(),
                            
                            NavigationLink{
                                TemperatureDewpointLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Take-off")
                            }label:{
                                IconTextHStack(text: AppTexts.temperatureDewpoint)
                            }
                                .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            TextWithFieldHStack(text: AppTexts.qnh, input: $viewModel.qnh, suffixText: "hPa").toAnyView()
                        ])
                        
                        itemSpacing()
                        
                        CapitalizedTextHalfOpacity(text: "Take-off settings")
                        
                        DividerWithActionsVstack(actions: [
                            
                            NavigationLink{
                                WeightMaxLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Take-off")
                            }label:{
                                TextTextIconHStack(leftText: "Weight / Max.", rightText: "12334 / 12334 lb", textOpacity : true)
                            }
                            .accentColor(AppColors.navAccentColor)
                            .toAnyView(),
                            
                                
                            NavigationLink{
                                DeicingLandingTakeOffOfpScreen(viewModel: viewModel, backBarText: "Take-off")
                            }label:{
                                TextTextIconHStack(leftText: "De-icing", rightText: "", textOpacity : true)
                            }
                            .accentColor(AppColors.navAccentColor)
                            .toAnyView(),
                            
                            ToggleSwitch(text: "Engine anti-ice").toAnyView(),
                            
                            CustomPopoverPicker(list: flapsSettings, leftText: "Take-off slaps").toAnyView(),
                            
                            TextWithFieldHStack(text: "Acceleration", input: $input).toAnyView()
                        ])
                        
                        
                    }
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    TakeOffDetailScreenOfpScreen()
}
