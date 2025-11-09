//
//  ListWheelPicker.swift
//  taillog
//
//  Created by Shubham Tiwari on 03/09/24.
//


import SwiftUI
struct ListWheelPicker: View {
    var list: [String]
    @Binding var selectedValue: String
    
    var body: some View {
        Picker("", selection: $selectedValue) {
            ForEach(list, id: \.self) { item in
                Text(item).tag(item)
            }
        }
        .pickerStyle(.wheel)
        .frame(height: 150) // Optional: Adjust the height if needed
    }
}
