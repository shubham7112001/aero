//
//  AppInfoBottomHomeScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/12/24.
//

import SwiftUI

struct AppInfoBottomHomeScreen: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel = HomeScreenViewModel()
    var body: some View {
        ZStack{
            Color(.bg)
            
            HStack {
                VStack{
                    CustomHeightSpacer(height: Dimensions.statusBarHeight)
                    
                    HStack{
                        HStack(spacing: 0){
                            IconImage(content: .systemImage(SFIcons.leftChevron))
                            
                            LightWhiteText(text: "Back")
                        }
                        .wrapInButton {
                            homeScreenViewModel.currBottomScreen = .defaultPage
                        }
                        
                        Spacer()
                    }
                    .overlay(
                        LightWhiteText(text: "App info")
                    )
                    
                    
                    SidebarSpacing()
                    
                    itemSpacing()
                    
                    sectionSpacing()
                    
                    logoTrademark()
                    
                    itemSpacing()
                    
                    sectionSpacing()
                    
                    LightWhiteText(text: "Version 4.4.56")
                    
                    LightWhiteText(text: "Build 61377")
                    
                    itemSpacing()
                    
                    LightWhiteText(text: "©2024 TAILLOG EFB")
                    
                    LightWhiteText(text: "All rights reserved.")
                    
                    sectionSpacing()
                    
                    LightWhiteText(text: "For more information about this application visit")
                    
                    itemSpacing()
                    
                    LightBlueText(text: "www.taillog.aero")
                        .wrapInButton {
                            UrlOpening().openWebsite(AppUrl.taillogAero)
                        }
                    
                    
                    sectionSpacing()
                    sectionSpacing()
                    sectionSpacing()
                    
                    LightWhiteText(text: "Customer support")
                    
                    itemSpacing()
                    
                    LightBlueText(text: "support@taillog.aero")
                        .wrapInButton {
                            UrlOpening().openWebsite(AppUrl.support)
                        }
                    
                    Spacer()
                    
                    VStack{
                        Text("Legal Information")
                            .foregroundStyle(.white)
                    }
                    .frame(width: Dimensions.sidebarWidth - Dimensions.defaultPadding ,height: Dimensions.defaultRowHeight)
                    .background(.black)
                    .roundedCorner(4, corners: CornerCombinations.all)
                    .padding(CustomPadding.lPadding)
                    .opacity(AppConstants.defaultOpacity)
                    .wrapInButton {
                        homeScreenViewModel.showLegalInfoSheet = true
                    }
                    
                    sectionSpacing()
                    
                }
                .padding(CustomPadding.padding)
            .frame(width: Dimensions.sidebarWidth)
                
                Spacer()
            }
            .customFlexSheet(isPresented: $homeScreenViewModel.showLegalInfoSheet, content: {
                LegalInformationSheet(homeScreenViewModel: homeScreenViewModel)
            })
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    AppInfoBottomHomeScreen(homeScreenViewModel: HomeScreenViewModel())
}
