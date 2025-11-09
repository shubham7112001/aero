//
//  HorizontalDividerDetailScreenNavigationSplitView.swift
//  taillog
//
//  Created by Shubham Tiwari on 09/07/24.
//

import SwiftUI

struct HorizontalDividerDetailScreenNavigationSplitView: View {
    var color : Color = Color.veryLightGrey
    var multiple : CGFloat = 1
    var width : CGFloat = Dimensions.navigationSplitViewDetailWidth
    var body: some View {
        HStack{
            
            Spacer()
            VStack{
                Divider()
                    .frame(width: width - Dimensions.spaceBwItems * multiple)
                    .foregroundStyle(color)
            }
            .frame(height: 1)
        }
        .frame(width: width)
           
    }
}

#Preview {
    HorizontalDividerDetailScreenNavigationSplitView()
}
