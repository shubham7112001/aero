//
//  TextWithCheck.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct TextWithCheck: View {
    @State var isCheck : Bool = false;
    var text : String
    var body: some View {
        VStack{
            Button{
                isCheck.toggle()
            }label:{
                HStack{
                    Text(text)
                        .foregroundStyle(.black)
                        .padding(CustomPadding.padding)
                    
                    
                    Spacer()
                    
                    if(isCheck){
                        DynamicChecks(isCheck: isCheck)
                            .padding(CustomPadding.rPadding)
                    }
                    
                }
            }
        }
        .background(.dWhite)
        .frame(height: Dimensions.defaultRowHeight)
    }
}

#Preview {
    TextWithCheck(isCheck: true, text : "Checklist items");
}
