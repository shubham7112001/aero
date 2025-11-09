//
//  ChecklistMultipleLineField.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/09/24.
//

import Foundation

import SwiftUI

struct ChecklistMultipleLineField : View {
    var checkListNumber : Int
    var textOpacity : Bool = true
    var leftOpacity : CGFloat = 1
    @State var inputString : String = ""
    var isApplicable : Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink{
                    TextFieldScreen(centerHeadingText: "[Checklist item \(checkListNumber)]", leftText: TextFunction.truncateText(AppTexts.preFlightAcceptance, length: 10), input: $inputString)
                }label:{
                    HStack{
                        DarkText(text: "[CheckList item \(checkListNumber)]")
                            .opacity(isApplicable ? 1 : AppConstants.defaultOpacity)
                           
                        
                        Spacer()
                        DarkText(text: inputString)
                            .opacity(AppConstants.defaultOpacity)
                        
                        Image(systemName: SFIcons.rightChevron)
                            .opacity(AppConstants.defaultOpacity)
                    }
                }
                .disabled(!isApplicable)
            }
        }
        .padding(CustomPadding.padding)
        .background(.white)
        .frame(height: Dimensions.defaultRowHeight)
        

    }

}
