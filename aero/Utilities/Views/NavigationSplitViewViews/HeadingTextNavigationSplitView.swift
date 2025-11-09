//
//  HeadingTextNavigationSplitView.swift
//  taillog
//
//  Created by Shubham Tiwari on 08/07/24.
//

import SwiftUI

struct HeadingTextNavigationSplitView: View {
    var  text : String
    var actions : [AnyView] = []
    var leadingActions : [AnyView] = []
    @Environment(\.dismiss) var dismiss
    var body: some View {
                Rectangle()
                    .fill(.lightAccentBlue)
                    .overlay(
                        ZStack{
                            HStack{
                                HStack{
                                    itemSpacingWidth()
                                    ForEach(leadingActions.indices, id : \.self){index in
                                        leadingActions[index]
                                    }
                                }
                                .wrapInButton {
                                    dismiss()
                                }
                                Spacer()
                                HStack{
                                    ForEach(actions.indices, id : \.self){index in
                                        actions[index]
                                    }
                                }
                                itemSpacingWidth()
                            }
                            DarkText(text: text, isBlack: false)
                        }
                        
                    )
                    .frame(height: Dimensions.ofpHeadingHeight)
                    
            }
}

#Preview {
    HeadingTextNavigationSplitView(text: "HEllo worlkd",actions: [
        DarkText(text  : "HEllo world").toAnyView()
    ])
}
