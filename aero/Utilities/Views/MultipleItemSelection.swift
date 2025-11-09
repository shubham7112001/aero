//
//  MultipleItemSelection.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct MultipleItemSelection: View {
    var list : [String] = [];
    var body: some View {
        VStack{
            ForEach(list.indices, id: \.self){index in
                VStack(spacing : 0){
                    TextWithCheck(text: list[index])
                    
                    if(index != list.count - 1){
                        Divider().padding(CustomPadding.lPadding)
                    }
                }
               
            }
        }
        .background(.dWhite)
    }
}

#Preview {
    MultipleItemSelection(list: ["a", "b", "c", "d"])
}
