//
//  ShowTimePicker.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/08/24.
//

import SwiftUI

struct ShowTimePicker: View {
    @Binding var timePicker: Date?
    
    @State private var hours: [String] = Array(0...12).map { String(format: "%02d", $0) }
    @State private var minutes: [String] = Array(0...59).map { String(format: "%02d", $0) }

    @State private var selectedHour = Calendar.current.component(.hour, from: Date())
    @State private var selectedMinute = Calendar.current.component(.minute, from: Date())
       
    var body: some View {
        VStack {
            HStack {
                Picker("Hour", selection: $selectedHour) {
                    ForEach(hours, id: \.self) { hour in
                        Text(hour).tag(Int(hour)!)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Picker("Minute", selection: $selectedMinute) {
                    ForEach(minutes, id: \.self) { minute in
                        Text(minute).tag(Int(minute)!)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            .frame(width: 200, height: 200)
            .onChange(of: selectedHour) { updateDate() }
            .onChange(of: selectedMinute) { updateDate() }
        }
        
    }
    
    private func updateDate() {
            var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
            components.hour = selectedHour
            components.minute = selectedMinute
            timePicker = Calendar.current.date(from: components)
        }
        
    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: timePicker ?? Date())
    }
        
}

#Preview {
    ShowTimePicker(timePicker: .constant(Date.now))
}
