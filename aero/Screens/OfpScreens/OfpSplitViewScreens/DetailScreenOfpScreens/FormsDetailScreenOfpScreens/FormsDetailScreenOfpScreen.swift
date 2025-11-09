//
//  FormsDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/07/24.
//

import SwiftUI

struct FormsDetailScreenOfpScreen: View {
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack{
                HeadingTextNavigationSplitView(text: AppTexts.forms,actions: [
                    Image(.loadUpWhite).toAnyView()
                ])
                
                ScrollView{
                    sectionSpacing()
                    
                    CapitalizedTextHalfOpacity(text: "CF Pka")
                    
                    VStack(spacing : 0){
                        ForEach(0..<30){index in
                            TextTextIconHStack(leftText: "HBHBHJ", rightText: "Enter Text")
                            Divider()
                            
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
    FormsDetailScreenOfpScreen()
}
