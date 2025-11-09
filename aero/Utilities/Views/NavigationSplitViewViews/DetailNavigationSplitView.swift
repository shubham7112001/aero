//
//  DetailNavigationSplitView.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/12/24.
//

import SwiftUI

func DetailNavigationSplitView<V: View>(leftText: String = "",heading: String = "Heading", actions: [AnyView] = [], leadingActions: [AnyView] = [], @ViewBuilder content: @escaping () -> V) -> some View {
    @Environment(\.dismiss) var dismiss
    let iconLeft: [AnyView] = [
        Image(systemName: SFIcons.leftChevron)
            .foregroundStyle(.dWhite)
            .toAnyView(),
        
        Text(leftText)
            .foregroundStyle(.dWhite)
            .toAnyView()
    ]
    let lActions: [AnyView] = iconLeft + leadingActions
    return
        ZStack{
            Color(.veryLightGrey)
            VStack{
                HeadingTextNavigationSplitView(text: heading, actions: actions, leadingActions: !leadingActions.isEmpty ? leadingActions : !leftText.isEmpty ? iconLeft : [])
                
                ScrollView{
                    sectionSpacing()
                    VStack(spacing: 0){
                        content()
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
}

#Preview {
    DetailNavigationSplitView(leftText: "leftText", heading : "My Heading", actions: [Text("").toAnyView()]){
                    Text("hii")
                    Text("hii")
                    Text("hii")
                }
}
