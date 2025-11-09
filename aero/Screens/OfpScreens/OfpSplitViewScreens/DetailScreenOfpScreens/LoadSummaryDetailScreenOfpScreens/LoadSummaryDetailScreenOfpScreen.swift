//
//  LoadSummaryDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/07/24.
//

import SwiftUI

struct LoadSummaryDetailScreenOfpScreen: View {
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack{
                HeadingTextNavigationSplitView(text: AppTexts.loadSummary)
                
                ScrollView{
                    sectionSpacing()
                    
                    CapitalizedTextHalfOpacity(text: "Payload")
                    
                    DividerWithActionsVstack(actions : [
                        TextTextHStack(leftText: "Persons on board", rightText: "56 РОВ").toAnyView(),
                        
                        
                        TextTextIconHStack(leftText: "Passengers", rightText: "54 PAX + 0 infant / 0 lb").toAnyView(),
                        
                        TextTextHStack(leftText: "Baggage & cargo", rightText: "0 lb").toAnyView(),
                    ])
                    
                    
                    Text("Passengers and Baggage & cargo can be edited in the section Weight & balance").opacity(AppConstants.defaultOpacity)
                    
                    sectionSpacing()
                    
                    CapitalizedTextHalfOpacity(text: "Weight")
                    
                    DividerWithActionsVstack(actions : [
                        TextTextHStack(leftText: "Dry operating", rightText: "30477 lb").toAnyView(),
                        
                        
                        TextTextIconHStack(leftText: "Payload / Under / Max.", rightText: "10174 / 5646 / 15820 b").toAnyView(),
                        
                        TextTextHStack(leftText: "Zero fuel / Max.", rightText: "40651 / 46297 lb").toAnyView(),
                    ])
                    
                    itemSpacing()
                    
                    DividerWithActionsVstack(actions : [
                        TextTextHStack(leftText: "Ramp / Discretionary fuel", rightText: "2981 / 0 lb").toAnyView(),
                        
                        
                        TextTextIconHStack(leftText: "Ramp / Under / Max.", rightText: "43632 / -35909 / 7723 lb").toAnyView(),
                        
                        TextTextHStack(leftText: "Take-off / Max.", rightText: "43509 / 50706 lb").toAnyView(),
                    ])
                    
                    itemSpacing()
                    
                    TextTextHStack(leftText: "Trip fuel", rightText: "1184 lb").background()
                    
                    itemSpacing()
                    
                    
                    DividerWithActionsVstack(actions : [
                        TextTextHStack(leftText: "Landing fuel", rightText: "1674 lb").toAnyView(),
                        
                        
                        TextTextIconHStack(leftText: "Landing / Max.", rightText: "442325 / 49273 lb").toAnyView()
                    ])
                    
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    LoadSummaryDetailScreenOfpScreen()
}
