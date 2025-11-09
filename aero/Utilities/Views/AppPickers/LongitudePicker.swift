//
//  LongitudePicker.swift
//  taillog
//
//  Created by Shubham Tiwari on 26/09/24.
//

import SwiftUI

struct LongitudePicker: View {
    @State private var degrees: Int = 1991
    @State private var minutes: Int = 1980
    @State private var seconds: Int = 1980
    @State private var direction: Character = "E"
    
    let directions = ["E", "W"]
    @Binding var model : LatLonModel
    
    var body: some View {
        VStack {
            HStack {
                Picker("", selection: $direction) {
                    ForEach(directions, id: \.self) {
                        Text($0)
                    }
                }
                .onChange(of: direction){
                    model.direction = direction
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 40)
                
                
                Picker("", selection: $degrees) {
                    ForEach(0..<4000, id: \.self) {index in
                        Text("\(index % 181)")
                    }
                }
                .onChange(of: degrees){
                    model.degree = degrees % 181
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 60)
                

                Picker("", selection: $minutes) {
                    ForEach(0..<4000, id: \.self) { value in
                        Text("\(value % 60)")
                    }
                }
                .onChange(of: minutes){
                    model.minute = minutes  % 60
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 60)
                

                Picker("", selection: $seconds) {
                    ForEach(0..<4000, id: \.self) { index in
                        Text("\(index % 60)") // Apply modulo 60 to seconds
                    }
                }
                .onChange(of: seconds){
                    model.second = seconds % 60
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 60)
            }
        }
        .onAppear(){
            degrees = model.degree + 1810
            minutes = model.minute + 900
            seconds = model.second + 900
            direction = model.direction
        }
        
       
    }
}

struct LongitudePickerPreview: View {
    @State private var resultant: String = ""

    var body: some View {
        LongitudePicker(model: .constant(LatLonModel(direction: "E", degree: 0, minute: 0, second: 0)))
    }
}

struct LongitudePicker_Previews: PreviewProvider {
    static var previews: some View {
        LongitudePickerPreview()
    }
}
