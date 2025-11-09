//
//  AlternatesDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct AlternatesDetailScreenOfpScreen: View {
    @StateObject var alternatesViewModel : AlternatesOfpViewModel = AlternatesOfpViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.veryLightGrey)
                VStack(spacing : 0){
                    HeadingTextNavigationSplitView(text: AppTexts.alternates)
                    
                    ScrollView{
                        sectionSpacing()
                        
                        PdfViewerRow(text: AppTexts.adequateAirportList,actions: [
                            IconImage(content: .systemImage(SFIcons.rightChevron),color: .black)
                                .opacity(AppConstants.defaultOpacity)
                                .toAnyView()
                        ])
                        
                        itemSpacing()
                        
                        CapitalizedTextWithImage(text: AppTexts.alternate1, image: .copyButton)
                        
                        CustomHeightSpacer(height: Dimensions.spaceBwItems / 2)
                        
                        DividerWithActionsVstack(actions: [
                            LeftColoredText(text: "VABB ISRIS W11 SUR DCT VASU",color: .black,opacity: AppConstants.defaultOpacity).toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.airportElevation, rightText: "VASU / STV / SURAT",leftOpacity: true, rightOpacity: true).toAnyView(),
                            
                            NavigationLink{
                                PlanningMinimaAlternatesOfpScreen(alternatesViewModel: alternatesViewModel)
                            }label:{
                                IconTextHStack(text: AppTexts.planning)
                            }
                            .accentColor(AppColors.navAccentColor)
                            .toAnyView(),
                            
                            NavigationLink{
                                RunwayAlternatesOfpScreen(alternatesViewModel: alternatesViewModel)
                            }label:{
                                TextTextIconHStack(leftText: AppTexts.runway, rightText: "2896 m")
                            }
                            .accentColor(AppColors.navAccentColor)
                            .toAnyView(),
                            
                            NavigationLink{
                                FacilitiesAlternatesOfpScreen(alternatesViewModel: alternatesViewModel)
                            }label:{
                                IconTextHStack(text: AppTexts.facilities)
                            }
                            .accentColor(AppColors.navAccentColor)
                            .toAnyView(),
                            
                                
                            NavigationLink{
                                VisibilityRvrAlternatesOfpScreen(alternatesViewModel: alternatesViewModel)
                            }label:{
                                IconTextHStack(text: AppTexts.visibilityRVR)
                            }
                            .accentColor(AppColors.navAccentColor)
                                .toAnyView(),
                            
                            TextTextHStack(leftText: AppTexts.ceiling, rightText: "ft", rightOpacity: true).toAnyView()
                        ])
                    }
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    AlternatesDetailScreenOfpScreen()
}
