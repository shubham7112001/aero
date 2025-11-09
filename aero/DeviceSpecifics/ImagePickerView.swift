//
//  ImagePickerView.swift
//  taillog
//
//  Created by Shubham Tiwari on 07/08/24.
//

import SwiftUI

struct ImagePickerView: View {
    @State private var showImagePicker = false
    @State private var images = [UIImage]()

    var body: some View {
        Button("Select Images") {
            self.showImagePicker = true
        }
        // <-- Here
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(showImagePicker: $showImagePicker, images: $images)
        }
        .onChange(of: images) {
            print("Images: ", images)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // <-- Here
            if let image = info[.originalImage] as? UIImage {
                self.parent.images = [image]
            }

            parent.showImagePicker = false // <-- Here
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    @Binding var showImagePicker: Bool // <-- Here
    @Binding var images: [UIImage]

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.modalPresentationStyle = .fullScreen
        picker.mediaTypes = ["public.image"]
        picker.videoQuality = .typeHigh
        picker.videoMaximumDuration = TimeInterval(30)
        picker.modalPresentationStyle = .popover
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        uiViewController.popoverPresentationController?.sourceRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
    }
}




#Preview {
    ImagePickerView()
}
