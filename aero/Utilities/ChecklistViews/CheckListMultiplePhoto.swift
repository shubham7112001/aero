//
//  CheckListMultiplePhoto.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CheckListMultiplePhoto: View {
    var checkListNumber : Int
    @State var images : [UIImage?] = []
    var isApplicable : Bool
    
    @State private var goToMultiplePhotoScreen : Bool = false;
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink{
                    MultiplePhotoScreen(images: $images)
                }label:{
                    VStack{
                        ImageSelectionStaticRow(text: "Checklist item \(checkListNumber)", addedText: images.count == 0  ? "" : "Attached", isImagePresent: images.count == 0  ? false : true, isOpacity: !isApplicable)
                        
                    }
                }
                .disabled(!isApplicable)
            }
            
        }
        
        
    }
}

#Preview {
    CheckListMultiplePhoto(checkListNumber: 1, isApplicable: true)
}
