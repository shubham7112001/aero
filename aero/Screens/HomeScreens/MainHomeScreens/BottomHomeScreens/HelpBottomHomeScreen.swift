//
//  HelpBottomHomeScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/12/24.
//

import SwiftUI

struct HelpBottomHomeScreen: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
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
                        LightWhiteText(text: "Help")
                    )

                    
                    
                    SidebarSpacing()
                    
                    SideBarRowView(text: "Quick guide", img: .systemImage(SFIcons.exclamationMarkCircle))
                        .wrapInButton {
                            homeScreenViewModel.showQuickGuideSheet = true
                        }
                    
                    SideBarRowView(text: "FAQ", img: .systemImage(SFIcons.questionMarkCircle), rightText: "internet")
                        .wrapInButton {
                            UrlOpening().openWebsite(AppUrl.support)
                        }
                    
                    SideBarRowView(text: "User manual", img: .systemImage(SFIcons.book), rightText: "internet")
                        .wrapInButton {
                            UrlOpening().openWebsite(AppUrl.userManual)
                        }
                    
                    itemSpacing()
                    
                    SidebarSpacing()
                    
                    LightWhiteText(text: "Internet connection is required for accessing the online FAQ and User Manual")
                        .opacity(AppConstants.defaultOpacity)
                    
                    Spacer()
                    
                    logoImage()
                    
                    CustomHeightSpacer(height: 100)
                }
                .padding(CustomPadding.padding)
                .frame(width: Dimensions.sidebarWidth)
                
                Spacer()
            }
            .customFlexSheet(isPresented: $homeScreenViewModel.showQuickGuideSheet, content: {
                QuickGuideSheet(homeScreenViewModel: homeScreenViewModel)
            })
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    HelpBottomHomeScreen(homeScreenViewModel: HomeScreenViewModel())
}
