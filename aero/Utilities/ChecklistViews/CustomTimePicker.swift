//
//  CheckListTimePicker.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CustomTimePicker: View {
    @Binding var time : Date
    var text : String
    @State private var showTimePicker : Bool = false;
    var isApplicable : Bool = true
    var showAmPm: Bool = false
    var body: some View {
        VStack{
            TextTextHStack(leftText: text, rightText: DateTimeFunctions.onlyTimeReadable(time), leftOpacity : !isApplicable , rightOpacity: true)

        }
        .wrapInButton {
            if(isApplicable){
                showTimePicker = true;
            }
        }
        .popover(isPresented : $showTimePicker){
                DatePicker("Select a date", selection: $time, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
                    .cornerRadius(10)
                    .frame(width: 300, height: 200)
                    .environment(\.locale, .init(identifier: showAmPm ? "en" : "en_GB"))
        }
    }
}

#Preview {
    CustomTimePicker(time: .constant(Date()), text : "Checklist item ID", isApplicable: true, showAmPm: true)
}
