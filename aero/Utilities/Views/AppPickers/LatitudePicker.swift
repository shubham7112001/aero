//
//  LattutudePicker.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/09/24.
//

import SwiftUI

struct LatitudePicker: View {
    @State private var degrees: Int = 2002
    @State private var minutes: Int = 1980
    @State private var seconds: Int = 2000
    @State private var direction: Character = "N"
    
    
    
    let directions = ["N", "S"]
    @Binding var model : LatLonModel
    
    var body: some View {
        VStack {
//            Text(resultant)
            HStack {
                Picker("Direction", selection: $direction) {
                    ForEach(directions, id: \.self) {
                        Text($0)
                    }
                }
                .onChange(of: direction){
                    model.direction = direction
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 40)
                
                Picker("Degrees", selection: $degrees) {
                    ForEach(0..<4000, id: \.self) {index in
                        Text("\(index % 91)")
                    }
                }
                .onChange(of: degrees){
                    model.degree = degrees % 91
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 60)

                Picker("Minutes", selection: $minutes) {
                    ForEach(0..<4000, id: \.self) {index in
                        Text("\(index % 60)")
                    }
                }
                .onChange(of: minutes){
                    model.minute = minutes % 60
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 60)

                Picker("Seconds", selection: $seconds) {
                    ForEach(0..<4000, id: \.self) {index in
                        Text("\(index % 10)")
                    }
                }
                .onChange(of: seconds){
                    model.second = seconds % 10
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 60)

                
            }
        }
        .onAppear(){
            degrees = model.degree + 910
            minutes = model.minute + 900
            seconds = model.second + 900
            direction = model.direction
        }
    }
}

#Preview {
    LatitudePicker(model: .constant(LatLonModel(direction: "N", degree: 10, minute: 20, second: 30)))
}
