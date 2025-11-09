//
//  LegalInformationSheet.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/12/24.
//

import SwiftUI

struct LegalInformationSheet: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
            VStack(spacing: 0){
                SheetHeadingView(heading: "Legal Information", cancelText: "Close",cancelTextColor: .dWhite, cancelFunction: {
                    if(!homeScreenViewModel.showLegalInfoSheet){
                        homeScreenViewModel.showLegalInfoSheet = true
                    }
                    homeScreenViewModel.showLegalInfoSheet = false
                    
                }, headingColor: .dWhite, bgColor: .main)
                .frame(width: Dimensions.flexSheetWidth)
                .background(.red)
                
                ScrollView{
                    
                    Text(AppTexts.legalInformationText)
                        .font(.system(size: 11))
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                    
                    CustomHeightSpacer(height: 100)
                    
                }
                
                Spacer()
            }
        }
        .frame(width: Dimensions.flexSheetWidth, height: Dimensions.flexSheetHeight)
    }
}

#Preview {
    LegalInformationSheet(homeScreenViewModel: HomeScreenViewModel())
}
