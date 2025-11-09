//
//  ModelWaypointsDetailOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/07/24.
//

import SwiftUI

struct ModelWaypointsDetailOfpScreen: View {
    var upperText : String
    var lowerText : String = "-"
    var textColor : Color = Color.black
    
    var body: some View {
        HStack{
            VStack(alignment : .leading){
                Text(upperText)
                    .foregroundStyle(textColor)
                    .font(AppFonts.defaultText)
                Text(lowerText.uppercased())
                    .foregroundStyle(textColor)
                    .opacity(AppConstants.defaultOpacity)
                    .font(AppFonts.defaultText)
            }
            Spacer()
            IconImage(content: .systemImage(SFIcons.rightChevron),size: 10, color: Color.gray)
                .opacity(AppConstants.defaultOpacity)
        }
        .padding(CustomPadding.padding)
        .background(.white)
    }
}

#Preview {
    ModelWaypointsDetailOfpScreen(upperText: "Data to be provided")
}
