//
//  CheckListDateTimeSelection.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CustomDateTimePicker: View {
    var text : String
    var isApplicable : Bool = true
    @State private var date : Date = Date()
    var isWheel : Bool = false
    @State var showDate : Bool = false;
    var body: some View {
        VStack{
            
                HStack{
                    Text(text)
                        .opacity(isApplicable ? 1 : AppConstants.defaultOpacity)
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Text("\(DateTimeFunctions.dateTimeReadable(date)) Z")
                        .opacity(AppConstants.defaultOpacity)
                        .foregroundStyle(.black)
                }
                .padding(CustomPadding.padding)
                
        
            
        }
        .wrapInButton {
            if(isApplicable){
                showDate = true;
            }
        }
        .popover(isPresented : $showDate){
            VStack{
                if(isWheel){
                    DatePicker("", selection: $date, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(WheelDatePickerStyle())
                    
                }else{
                    DatePicker("", selection: $date, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
            }
                .cornerRadius(10)
                .frame(width: 300, height: isWheel ? 250 : 350)
        }
        
    }
}

#Preview {
    CustomDateTimePicker(text:"Date selection",isApplicable: true, isWheel: true)
}
