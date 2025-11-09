//
//  QuickGuideSheet.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/12/24.
//

import SwiftUI

struct QuickGuideSheet: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
            VStack(spacing: 0){
                SheetHeadingView(heading: "Quick guide", cancelText: "Close", cancelTextColor: .dWhite, cancelFunction: {
                    if(!homeScreenViewModel.showQuickGuideSheet){
                        homeScreenViewModel.showQuickGuideSheet = true
                    }
                    homeScreenViewModel.showQuickGuideSheet = false
                    
                }, headingColor: .dWhite, bgColor: .main)
                .frame(width: Dimensions.flexSheetWidth)
               
                VStack(spacing: 0){
                    TabView(selection: $homeScreenViewModel.quickGuideSelection){
                        ForEach(homeScreenViewModel.quickGuideList, id: \.self) { guide in
                            Image(uiImage: guide)
                                .resizable()
                                .scaledToFit()
                                .frame(width: Dimensions.flexSheetWidth)
                            
                        }
                    }
                    .tabViewStyle(.page)
                }
                .frame(width: Dimensions.flexSheetWidth, height: Dimensions.flexSheetWidth)
                
                
                VStack{
                    
                    HStack(spacing: 12) {
                        ForEach(homeScreenViewModel.quickGuideList.indices, id: \.self) { index in
                            Circle()
                                .fill(homeScreenViewModel.quickGuideList[index] == homeScreenViewModel.quickGuideSelection ? Color.black : Color.gray)
                                .frame(width: 8, height: 8)
                                .scaleEffect(homeScreenViewModel.quickGuideList[index] == homeScreenViewModel.quickGuideSelection ? 1.2 : 1.0)
                                .opacity(AppConstants.defaultOpacity)
                                .wrapInButton {
                                    withAnimation(.easeIn){
                                        homeScreenViewModel.quickGuideSelection = homeScreenViewModel.quickGuideList[index]
                                    }
                                }
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
                .frame(width: Dimensions.flexSheetWidth)
                .background(.dWhite)
                    
                
                
            }
        }
        .frame(width: Dimensions.flexSheetWidth, height: Dimensions.flexSheetHeight)
    }
}

#Preview {
    QuickGuideSheet(homeScreenViewModel: HomeScreenViewModel())
}
