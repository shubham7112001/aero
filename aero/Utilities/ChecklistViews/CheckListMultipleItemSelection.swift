//
//  CheckListMultipleItemSelection.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CheckListMultipleItemSelection: View {
    var checklistNumber : Int
    
    var list : [String] = [];
    
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
            VStack(spacing: 0){
                
                HeadingInternalScreenOfpScreen(leftText: AppTexts.preFlightAcceptance, centerText: "Checklist item \(checklistNumber)")
                ScrollView{
                    LazyVStack(spacing : 0){
                        sectionSpacing()
                        
                        MultipleItemSelection(list: list)
                        
                    }
                    
                }
            }
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CheckListMultipleItemSelection(checklistNumber: 1,list: MockDataFile.sampleItems)
}
