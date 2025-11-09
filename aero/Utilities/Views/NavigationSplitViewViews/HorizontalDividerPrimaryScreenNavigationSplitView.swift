//
//  HorizontalDividerPrimaryScreenNavigationSplitView.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct HorizontalDividerPrimaryScreenNavigationSplitView: View {
    var color : Color = Color.veryLightGrey
    var size : CGFloat = Dimensions.spaceBwItems * 3.25;
    var body: some View {
        HStack(spacing : 0){
            Spacer()
            VStack{
                Divider()
                    .frame(width:  Dimensions.navigationSplitViewPrimaryWidth -  size)
                    .foregroundStyle(color)
            }
            .frame(height: 1)
        }
        .frame(width: Dimensions.navigationSplitViewPrimaryWidth)
           
    }
}

#Preview {
    HorizontalDividerPrimaryScreenNavigationSplitView()
}
