//
//  DividerWithActionsVstack.swift
//  taillog
//
//  Created by Shubham Tiwari on 12/07/24.
//

import SwiftUI

struct DividerWithActionsVstack: View {
    var actions : [AnyView] = []
    var bgColor : Color = Color.white
    var body: some View {
        VStack(spacing : 0){
            ForEach(actions.indices,id: \.self){index in
                VStack(spacing:0){
                    actions[index]
                        .frame(height: Dimensions.defaultRowHeight)
                    if index != actions.count - 1 {
                        Divider()
                            .frame(height: 1)
                            .padding(CustomPadding.lPadding)
                    }
                }
            }
        }
        .padding(CustomPadding.none)
        .background(bgColor)
        
    }
}

#Preview {
    DividerWithActionsVstack(
        actions: [
            Text("Datat")
                .toAnyView(),
            Text("Datat").toAnyView(),
            Text("Datat").toAnyView(),
            Text("Datat").toAnyView(),
            Text("Datat").toAnyView()
            ]
    )
}
