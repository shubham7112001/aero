//
//  ImageSelectionWithTextsView.swift
//  taillog
//
//  Created by Shubham Tiwari on 12/08/24.
//

import SwiftUI

struct ImageSelectionWithText: View {
    
    @State private var showAlert: Bool = false;
    @State private var showPhotoPicker: Bool = false;
    
    @State private var showCamera: Bool = false;
    @State private var showImageSheet: Bool = false;
    
    @Binding var selectedImage: UIImage?
    let index : Int
    @State private var photoPickerImage = [UIImage]()
    
    var size : CGFloat
    var width : CGFloat? = nil
    var height : CGFloat? = nil
    
    var body: some View {
        VStack{
            Button{
                if(selectedImage == nil){
                    showAlert = true;
                }
                else{
                    showImageSheet = true;
                }
            }label: {
                if(selectedImage == nil){
                    VStack{
                        
                        Text("Click to")
                            .font(AppFonts.mediumText)
                            .foregroundColor(.mainBlue)
                        
                        Text("Add Photo")
                            .font(AppFonts.mediumText)
                            .foregroundColor(.mainBlue)
                        
                        
                    }
                }
                    else{
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .frame(width :width ?? size,height: height ?? size)
                            .ignoresSafeArea()
                    }
            }
            
        }
        .frame(width : width ?? size,height: height ?? size)
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

//#Preview {
//    ImageSelectionWithText(size: 100)
//}
