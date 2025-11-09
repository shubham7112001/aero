//
//  SendFeedBackBottomHomeScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/12/24.
//

import SwiftUI

struct SendFeedBackBottomHomeScreen: View {
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
                        LightWhiteText(text: "Feedback")
                    )
                    
                    
                    SidebarSpacing()
                    
                    SideBarRowView(text: "Rate in tunes", img: .systemImage(SFIcons.star), rightText: "internet")
                        .wrapInButton {
                            UrlOpening().openWebsite(AppUrl.appStore)
                        }
                        
                    
                    SideBarRowView(text: "Send feedback", img: .systemImage(SFIcons.message), rightText: "internet")
                        .wrapInButton {
                        }
                    
                    SideBarRowView(text: "Report a problem", img: .systemImage(SFIcons.exclamationMarkTriangle), rightText: "internet")
                        .wrapInButton {
                        }
                    
                    itemSpacing()
                    
                    SidebarSpacing()
                    
                    LightWhiteText(text: "Internet connection is required for sending feedback.")
                        .opacity(AppConstants.defaultOpacity)
                    
                    Spacer()
                    
                    logoImage()
                    
                    CustomHeightSpacer(height: 100)
                }
                .padding(CustomPadding.padding)
            .frame(width: Dimensions.sidebarWidth)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    SendFeedBackBottomHomeScreen(homeScreenViewModel: HomeScreenViewModel())
}
