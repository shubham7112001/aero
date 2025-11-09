//
//  CheckListDateSelection.swift
//  taillog
//
//  Created by Shubham Tiwari on 19/09/24.
//

import SwiftUI

struct CheckListDateSelection: View {
    var text : String
    var isApplicable : Bool = true;
    @State private var date : Date = Date()
    
    @State var showDate : Bool = false;
    var body: some View {
        VStack{
                HStack{
                    Text(text)
                        .opacity(isApplicable ? 1 : AppConstants.defaultOpacity)
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Text(DateTimeFunctions.onlyDateReadable(date))
                        .opacity(AppConstants.defaultOpacity)
                        .foregroundStyle(.black)
                }
                
                .opacity(isApplicable ? 1 : AppConstants.defaultOpacity)
                .wrapInButton {
                    if(isApplicable){
                        showDate = true;
                    }
                }
                .background()
                .padding(CustomPadding.padding)
                
            
        }
        
        .background()
        .popover(isPresented : $showDate){
                DatePicker("Select a date", selection: $date, displayedComponents:.date)
                    .datePickerStyle(GraphicalDatePickerStyle())                    .cornerRadius(10)
                    .frame(width: 300, height: 300)
        }
        
    }
}

#Preview {
    CheckListDateSelection(text : "Hi this side Shubham Tiwari")
}
