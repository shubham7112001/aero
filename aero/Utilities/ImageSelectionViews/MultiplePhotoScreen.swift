//
//  CheckListMultiplePhotos.swift
//  taillog
//
//  Created by Shubham Tiwari on 18/09/24.
//

import SwiftUI

struct MultiplePhotoScreen: View {
    @Binding var images : [UIImage?]
    @State private var showImageAlert : Bool = false;
    @State private var selectedImage : UIImage? = nil;
    
    @State private var deleteRow : Bool = false;
    @State private var currIdx : Int? = nil
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
            VStack(spacing: 0){
                HeadingInternalScreenOfpScreen(leftText: AppTexts.preFlightAcceptance, centerText: "Checklist item")
                
                ScrollView{
                    VStack(spacing : 0){
                        sectionSpacing()
                        
                        VStack(spacing : 0){
                            VStack(spacing: 0){
                                ForEach(0..<images.count, id: \.self){index in
                                    Button{
                                        
                                    }label:{
                                        ImageSelectionRow(text: "Photo \(String(describing: index + 1))", selectedImage: $images[index], isImageSelection: false, addedText: "")
                                    }
                                    Divider().padding(CustomPadding.lPadding)
                                }
                                
                            }
                            .background(.dWhite)
                            itemSpacing()
                        }
                        
                        Button{
                            showImageAlert = true;
                        }label:{
                            HStack(spacing : 0){
                                Spacer()
                                ImageSelectionText(showAlert: $showImageAlert, text: "Add Photo",selectedImage: $selectedImage).padding(CustomPadding.padding)
                                Spacer()
                            }
                            .background(.dWhite)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onChange(of: images){
            print(images.count);
        }
        .onChange(of: selectedImage){
            if(selectedImage != nil){
                images.append(selectedImage)
            }
            else{
                selectedImage = nil
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

struct ImagePreviewView_Previews: PreviewProvider {
    @State static var sampleImages: [UIImage?] = [
        UIImage(named: SFIcons.checkmark),
        nil,
        UIImage(named: SFIcons.checkmark),
        UIImage(named: SFIcons.checkmark),
        UIImage(named: SFIcons.checkmark),
        UIImage(named: SFIcons.checkmark)
    ]
    
    static var previews: some View {
        MultiplePhotoScreen(images: $sampleImages)
    }
}
