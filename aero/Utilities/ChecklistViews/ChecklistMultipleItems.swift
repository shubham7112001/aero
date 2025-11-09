//
//  TextWithCheck.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

#Preview {
    ChecklistMultipleItems(checklistNumber: 1, list: MockDataFile.sampleItems)
}


struct ChecklistMultipleItems: View {
    var checklistNumber : Int
    var list : [String] = [];
    var isApplicable : Bool = true;
    var body: some View {
        
        NavigationStack{
            NavigationLink{
                CheckListMultipleItemSelection(checklistNumber: checklistNumber, list: list)
            }label:{
                VStack{
                    TextTextIconHStack(leftText: "Checklist item \(checklistNumber)", rightText: "Enter Text", leftOpacity:  isApplicable ? 1 : AppConstants.defaultOpacity)
                }
            }
            .disabled(!isApplicable)
            
        }
    }
}





