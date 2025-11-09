//
//  SimpleBackButtonScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/09/24.
//

import SwiftUI

struct SimpleBackButtonScreen: View {
    var leftText : String = "Back"
    var centerText : String
    var views : AnyView?
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
            VStack{
                
                HeadingInternalScreenOfpScreen(leftText: leftText, centerText: centerText)
                
                ScrollView{
                    sectionSpacing()
                    
                    views
                }
            }
        }
    }
}

#Preview {
    SimpleBackButtonScreen(centerText: "Center text")
}
