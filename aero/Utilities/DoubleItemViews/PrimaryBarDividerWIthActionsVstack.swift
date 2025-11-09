//
//  PrimaryBarDividerWIthActionsVstack.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/08/24.
//

import SwiftUI

struct PrimaryBarDividerWIthActionsVstack: View {
        var actions : [AnyView] = []
        var bgColor : Color = Color.white
        var body: some View {
            VStack(spacing : 0){
                ForEach(actions.indices,id: \.self){index in
                    VStack(spacing:0){
                        actions[index]
                        if index != actions.count - 1 {
                            Divider()
                                .padding(.leading, 24)
                        }
                    }
                    .frame(width: Dimensions.navigationSplitViewPrimaryWidth,height: Dimensions.defaultRowHeight - 2)
                }
                
            }
            
            .background(bgColor)
            
        }
    }

#Preview {
    PrimaryBarDividerWIthActionsVstack()
}
