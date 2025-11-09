//
//  CheckMarksListsWithDivider.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/08/24.
//

import SwiftUI

struct CheckMarksListsWithDivider: View {
        let title: String
        @Binding var items: [TextWithCheckMarkItem]
        
        var body: some View {
            VStack(spacing:0) {
                itemSpacing()
                CapitalizedTextHalfOpacity(text: title)
                
                VStack(spacing: 0) {
                    ForEach(items.indices, id: \.self) { index in
                        Button {
                            items[index].isCheckmark.toggle()
                        } label: {
                            VStack(spacing: 0) {
                                TextWithCheckMark(text: items[index].text, isCheckmark: items[index].isCheckmark)
                                
                                if index != items.count - 1 {
                                    Divider()
//                                        .customPadding(leading: Dimensions.spaceBwItems)
                                }
                            }
                        }
                    }
                }
                .background(.white)
            }
        }
    }

#Preview {
    CheckMarksListsWithDivider(title: "Heding text", items: .constant([TextWithCheckMarkItem(text: "data tis here", isCheckmark: true)]))
}
