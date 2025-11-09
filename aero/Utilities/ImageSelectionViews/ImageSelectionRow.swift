//
//  ImageSelectionRow.swift
//  taillog
//
//  Created by Shubham Tiwari on 12/08/24.
//

import SwiftUI

struct ImageSelectionRow: View {
    var text: String
    @State private var showAlert: Bool = false;
    @State private var showPhotoPicker: Bool = false;
    
    @State private var showCamera: Bool = false;
    @State private var showImageSheet: Bool = false;
    
    @Binding var selectedImage: UIImage?
    @State private var photoPickerImage = [UIImage]()
    var isImageSelection : Bool = true;
    var addedText : String = "Attached"
    var isApplicable : Bool = true;
    
    var body: some View {
        VStack{
                ImageSelectionStaticRow(text: text, addedText: addedText, isImagePresent: selectedImage != nil ? true : false, isOpacity: !isApplicable)
                .onTapGesture {
                    if (selectedImage == nil && isImageSelection){
                        if(isApplicable){
                            showAlert = true;
                        }
                    }
                    else{
                        showImageSheet = true;
                    }
                }
            
        }
        .frame(width : Dimensions.navigationSplitViewDetailWidth,
               height: Dimensions.defaultRowHeight)
        .background()
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

#Preview {
    ImageSelectionRow(text: "Some Random Text",selectedImage: .constant(nil))
}
