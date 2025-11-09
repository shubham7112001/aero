//
//  MandatoryDataDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/07/24.
//

import SwiftUI

struct MandatoryDataDetailScreenOfpScreen: View {
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
            VStack(spacing : 0){
                HeadingTextNavigationSplitView(text: AppTexts.mandatoryData)
                
                ScrollView{
                    sectionSpacing()
                    
                    CapitalizedTextHalfOpacity(text: "PIC CHECKS & APPROVAL")
                    
                    VStack(spacing : 0){
                        ForEach(0 ..< 10){index in
                            IconTextHStack(text: "Checklists").background()
                            HorizontalDividerDetailScreenNavigationSplitView()
                        }
                    }
                    .background(.white)
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    MandatoryDataDetailScreenOfpScreen()
}
