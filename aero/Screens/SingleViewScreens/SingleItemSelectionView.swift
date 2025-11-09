//
//  SingleItemSelectionView.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/09/24.
//

import SwiftUI

struct SingleItemSelectionView: View {
    var itemsList : [String]
    var capitalizedText : String = ""
    @State var selectdIndex : Int? = nil
    var body: some View {
        VStack(spacing : 0){
            if(!capitalizedText.isEmpty){
                CapitalizedTextHalfOpacity(text: capitalizedText)
                    .padding(CustomPadding.bPadding)
            }
            VStack(spacing : 0){
                ForEach(itemsList.indices,id: \.self){index in
                    
                    VStack(spacing: 0){
                        TextWithCheckMark(text: itemsList[index], isCheckmark: selectdIndex == index ? true : nil)
                        if index != itemsList.count - 1 {
                            Divider().padding(CustomPadding.lPadding)
                        }
                    }
                    .wrapInButton {
                        if(selectdIndex == index){
                            selectdIndex = nil
                        }else{
                            selectdIndex = index
                        }
                    }
                    
                }
            }
            .background(.dWhite)
        }
    }
}

#Preview {
    SingleItemSelectionView(itemsList: ["Good","Morning"])
}
