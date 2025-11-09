//
//  ImagePickerAlertView.swift
//  taillog
//
//  Created by Shubham Tiwari on 07/08/24.
//

import SwiftUI
import PhotosUI

struct ImagePickerAlertView: View {
    @State var text : String
    
    @State var captureImage : Bool = false;
    @State var selectImage : Bool = false;
    
    @Binding var selectedImage: UIImage?
    @State private var photoPickerImage = [UIImage]()
    
    @State private var showImageSheet  : Bool = false;
//    @State private var selectedItem: PhotosPickerItem? = nil
    var body: some View {
        VStack{
            Button{
                captureImage.toggle()
                print(captureImage)
            }label:{
                Text("Camera")
            }
            
            Button{
                selectImage.toggle()
            }label:{
                Text("Photo Library")
            }
            
            Button("Cancel",role : .cancel){
            }
        }
        .fullScreenCover(isPresented: $captureImage, content: {
            CameraAccessView(selectedImage: $selectedImage)
        })
        .onChange(of: selectImage) {
            if(!photoPickerImage.isEmpty){
                self.selectedImage = photoPickerImage[0]
                let data = ImageSheet(text : text,image: $selectedImage)
                print(data)
            }
        }
        .sheet(isPresented: $selectImage) {
            ImagePicker(showImagePicker: $selectImage, images: $photoPickerImage)
        }
        .sheet(isPresented : $showImageSheet){
            if(selectedImage != nil){
                Image(uiImage: selectedImage!)
            }
        }
    }
}
