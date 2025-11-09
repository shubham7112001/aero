//
//  ImagePickerAlertFunction.swift
//  taillog
//
//  Created by Shubham Tiwari on 07/08/24.
//

import SwiftUI

class ImagePickerAlertFunction{
    static func imagePicker(captureImage: Binding<Bool>, selectImage: Binding<Bool>) -> Alert {
        Alert(
            title: Text("Choose Photo Option"),
            message: Text("Choose the image"),
            primaryButton: .default(Text("Camera")) {
                captureImage.wrappedValue = true
            },
            secondaryButton: .default(Text("Photo Library")) {
                selectImage.wrappedValue = true
            }
        )
    }
}
