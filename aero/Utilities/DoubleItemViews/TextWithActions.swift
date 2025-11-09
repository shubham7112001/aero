//
//  TextWithActions.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct TextWithActions: View {
    var text : String
    var actions: [AnyView] = []
    var isOpacity : Bool = false;
    var body: some View {
        HStack{
            itemSpacingWidth()
            DarkText(text: text)
                .opacity(isOpacity ? AppConstants.defaultOpacity : 1)
            Spacer()
            ForEach(actions.indices, id: \.self) { index in
                HStack{
                    CustomWidthSpacer(width: Dimensions.spaceBwItems / 2)
                    actions[index]
                    
                }
                
            }
            itemSpacingWidth()
        }
        .frame(height: Dimensions.defaultRowHeight)
        .background(.white)
    }
}

#Preview {
    TextWithActions(text: "Text",actions: [
        Text("Data").toAnyView(),
        Text("Data").toAnyView(),
        Text("Data").toAnyView(),
    ])
}
