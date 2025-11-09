//
//  SidebarLightWhiteText.swift
//  taillog
//
//  Created by Shubham Tiwari on 22/07/24.
//

import SwiftUI

struct SidebarLightWhiteText: View {
    var text : String
    var body: some View {
        VStack{
            HStack{
                LightBlackText(text: text)
                    .foregroundStyle(.white)
                
                Spacer()
            }
        }
        
        
    }
}
