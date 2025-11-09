//
//  DefaultBottomHomeScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/12/24.
//

import SwiftUI

struct DefaultBottomHomeScreen: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    var body: some View {
        HStack{
            HStack{
                itemSpacingWidth()
                VStack(spacing: 0){
                    CustomHeightSpacer(height: Dimensions.statusBarHeight)
                    SideBarRowView(text: AppTexts.row, img: .customImage(Image(.confMenuAccount)))
                    
                    SidebarSpacing()
                    
                    SideBarRowView(text: AppTexts.avlFlightPlan, img: .customImage(Image(.loadDownWhite)), bgColor: homeScreenViewModel.currScreen == .avlFlightPlan ? .black : .clear)
                        .wrapInButton {
                            homeScreenViewModel.currScreen = .avlFlightPlan
                            homeScreenViewModel.toggleOffset()
                        }
                    
                    
                    
                    SideBarRowView(text: AppTexts.flightProgress, img: .customImage(Image(.confMenuLogPlay)), bgColor: homeScreenViewModel.currScreen == .flightProgress ? .black : .clear)
                        .wrapInButton {
                            homeScreenViewModel.currScreen = .flightProgress
                            homeScreenViewModel.toggleOffset()
                        }
                    
                    
                    SideBarRowView(text: AppTexts.completedFlightLogs, img: .customImage(Image(.confMenuLib)), bgColor: homeScreenViewModel.currScreen == .completedFlightLog ? .black : .clear)
                        .wrapInButton {
                            homeScreenViewModel.currScreen = .completedFlightLog
                            homeScreenViewModel.toggleOffset()
                        }
                    
                    SidebarSpacing()
                    
                    SideBarRowView(text: AppTexts.companyDocuments, img: .customImage(Image(.confMenuCompDoc)), bgColor: homeScreenViewModel.currScreen == .companyDoc ? .black : .clear)
                        .wrapInButton {
                            homeScreenViewModel.currScreen = .companyDoc
                            homeScreenViewModel.toggleOffset()
                        }
                    
                    
                    
                    SideBarRowView(text: AppTexts.securitySealLog, img: .customImage(Image(.sslMenu)), bgColor: homeScreenViewModel.currScreen == .securitySealLog ? .black : .clear)
                        .wrapInButton {
                            homeScreenViewModel.currScreen = .securitySealLog
                            homeScreenViewModel.toggleOffset()
                        }
                    
                    
                    SidebarSpacing()
                    
                    SideBarRowView(text: AppTexts.configuration, img: .customImage(Image(.confMenuPar)), bgColor: homeScreenViewModel.currScreen == .configuration ? .black : .clear)
                        .wrapInButton {
                            homeScreenViewModel.currScreen = .configuration
                            homeScreenViewModel.toggleOffset()
                        }
                    
                    
                    SidebarSpacing()
                    
                    SidebarLightWhiteText(text: AppTexts.sendFeedback)
                        .wrapInButton {
                            homeScreenViewModel.currBottomScreen = .sendFeedback
                        }
                    
                    SidebarSpacing()
                    
                    SidebarLightWhiteText(text: AppTexts.help)
                        .wrapInButton {
                            homeScreenViewModel.currBottomScreen = .help
                        }
                    
                    SidebarSpacing()
                    
                    SidebarLightWhiteText(text: AppTexts.applicationInformation)
                        .wrapInButton {
                            homeScreenViewModel.currBottomScreen = .appInfo
                        }
                    
                    SidebarSpacing()
                    
                    
                    Spacer()
                    
                    logoImage()
                    
                    CustomHeightSpacer(height: 100)
                }
            }
            .frame(width: Dimensions.sidebarWidth)
            
            Spacer()
        }
        .background(.bg)
    }
}

#Preview {
    DefaultBottomHomeScreen(homeScreenViewModel: HomeScreenViewModel())
}
