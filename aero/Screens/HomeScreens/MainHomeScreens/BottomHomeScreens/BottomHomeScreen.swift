//
//  BottomHomeScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/12/24.
//

import SwiftUI

struct BottomHomeScreen: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    var body: some View {
        ZStack{
            
            DefaultBottomHomeScreen(homeScreenViewModel: homeScreenViewModel)
                .offset(x: homeScreenViewModel.currBottomScreen != .defaultPage ? -100 : 0)
                .animation(.easeInOut, value: homeScreenViewModel.currBottomScreen)
                .zIndex(0)
            
            Group{
                switch(homeScreenViewModel.currBottomScreen){
                    
                case .defaultPage:
                    EmptyView()
                    
                case .sendFeedback:
                    SendFeedBackBottomHomeScreen(homeScreenViewModel: homeScreenViewModel)
                    
                case .help:
                    HelpBottomHomeScreen(homeScreenViewModel: homeScreenViewModel)
                    
                case .appInfo:
                    AppInfoBottomHomeScreen(homeScreenViewModel: homeScreenViewModel)
                    
                }
            }
            .animation(.easeInOut, value: homeScreenViewModel.currBottomScreen)
            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            .zIndex(1)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BottomHomeScreen(homeScreenViewModel: HomeScreenViewModel())
}
