//
//  ImageSelectionText.swift
//  taillog
//
//  Created by Shubham Tiwari on 19/09/24.
//

import SwiftUI

struct ImageSelectionText: View {
    @Binding var showAlert: Bool;
    var text : String;
    @State private var showPhotoPicker: Bool = false;
    
    @State private var showCamera: Bool = false;
    @State var showImageSheet: Bool = false;
    
    @Binding var selectedImage: UIImage?
    @State private var photoPickerImage = [UIImage]()
    var body: some View {
        VStack{
            Button{
                showAlert = true;
            }label: {
                Text(text)
                    .font(AppFonts.mediumText)
                    .foregroundColor(.mainBlue)
            }
            .alert("Choose Photo Option",isPresented : $showAlert){
                Button{
                    showCamera = true;
                }label:{
                    Text("Camera")
                }
                
                Button{
                    showPhotoPicker = true;
                }label:{
                    Text("Photo Library")
                }
                
                Button("Cancel",role : .cancel){
                }
            }
            .fullScreenCover(isPresented: $showCamera, content: {
                CameraAccessView(selectedImage: $selectedImage)
            })
            .onChange(of: photoPickerImage) {
                if(!photoPickerImage.isEmpty){
                    self.selectedImage = photoPickerImage[0]
                }else{
                    self.selectedImage = nil;
                }
            }
            .sheet(isPresented: $showPhotoPicker) {
                ImagePicker(showImagePicker: $showPhotoPicker, images: $photoPickerImage)
            }
            .sheet(isPresented : $showImageSheet){
                ImageSheet(text: "Selected Image", image: $selectedImage)
            }
        }
    }
}


struct ImageSelectionText_Previews: PreviewProvider {
    @State static  var showAlert = true
    @State static var selectedImage: UIImage? = nil
    
    static var previews: some View {
        ImageSelectionText(
            showAlert: $showAlert,
            text: "Add Photo",
            selectedImage: $selectedImage
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
