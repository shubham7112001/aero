//
//  ImageSheet.swift
//  taillog
//
//  Created by Shubham Tiwari on 07/08/24.
//

import SwiftUI

struct ImageSheet: View {
    @Environment(\.presentationMode) var presentationMode
    var text : String
    @Binding var image : UIImage?
    @State private var showDeleteAlert : Bool = false;
    var body: some View {
        GeometryReader{geometry in
            VStack(spacing : 0){
                HStack{
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label:{
                        Text(AppTexts.close)
                            .font(AppFonts.defaultText)
                            .foregroundStyle(.mainBlue)
                    }
                    Spacer()
                    
                    Text(text)
                        .font(AppFonts.defaultText)
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Button{
                        showDeleteAlert = true
                    }label: {
                        Text(AppTexts.delete)
                            .font(AppFonts.defaultText)
                            .foregroundStyle(.red)
                    }
                    
                }
                .padding(CustomPadding.hPadding)
                .frame(height: Dimensions.sheetHeaderHeight)
                
                VStack{
                    if let uiImage = image {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.93)
                            .ignoresSafeArea()
                        
                    } else {
                        Text("No Image")
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.93)
            }
            .alert(isPresented: $showDeleteAlert) {
                Alert(
                                title: Text("Delete Image "),
                                message: Text("Do you want to delete this image?"),
                                primaryButton: .destructive(Text("Delete"), action: {
                                    image = nil
                                }),
                                secondaryButton: .cancel(Text("Cancel"))
                            )
                    }
        }
    }
}

#Preview {
        ImageSheet(text : "Defect 1", image: .constant(UIImage(systemName: SFIcons.trash)
                                                      ))
}
