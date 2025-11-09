//
//  CustomStandardPickerView.swift
//  taillog
//
//  Created by Shubham Tiwari on 17/12/24.
//

import SwiftUI

struct CustomStandardPickerView: UIViewRepresentable {
    var data: [[String]]
    @Binding var selections: [Int]
    
    //makeCoordinator()
    func makeCoordinator() -> CustomStandardPickerView.Coordinator {
        Coordinator(self)
    }

    //makeUIView(context:)
    func makeUIView(context: UIViewRepresentableContext<CustomStandardPickerView>) -> UIPickerView {
        let picker = UIPickerView(frame: .zero)
        
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator

        return picker
    }

    //updateUIView(_:context:)
    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<CustomStandardPickerView>) {
        for i in 0...(self.selections.count - 1) {
            view.selectRow(self.selections[i], inComponent: i, animated: false)
        }
        context.coordinator.parent = self // fix
    }
    
    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: CustomStandardPickerView
        
        //init(_:)
        init(_ pickerView: CustomStandardPickerView) {
            self.parent = pickerView
        }
        
        //numberOfComponents(in:)
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return self.parent.data.count
        }
        
        //pickerView(_:numberOfRowsInComponent:)
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.parent.data[component].count
        }
        
        //pickerView(_:titleForRow:forComponent:)
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.parent.data[component][row]
        }
        
        //pickerView(_:didSelectRow:inComponent:)
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selections[component] = row
        }
    }
}
