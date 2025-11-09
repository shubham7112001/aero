//
//  PdfViewer.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/09/24.
//

import SwiftUI


struct PdfViewer: View {
    @Environment(\.presentationMode)  var presentationMode
    var filePath : String
    @State var rotationAngle: CGFloat = 0.0
    
    var body: some View {
        
            VStack(spacing : 0){
                HStack(alignment: .center){
                    Spacer()
                    Text("MMD 1331 : EKCH-EPSC : 23 SEP 2024 07 : 15 Z")
                        .foregroundStyle(.dWhite)
                        .padding(CustomPadding.tPadding)
                    Spacer()
                }
                .frame(height: 40)
                .padding(CustomPadding.padding)
                .background(.bg)
                
                
                HeadingTextNavigationSplitView(text: "Wind & temperature", actions: [
                    
                    AppBarIcon(icon: SFIcons.canvasDraawing).toAnyView(),
                    
                    Button{
                        rotationAngle -= .pi/2;
                    }label:{
                        AppBarIcon(icon: SFIcons.rotate)
                    }
                        .toAnyView(),
                    
                    AppBarIcon(icon: SFIcons.squareAndArrowUp).toAnyView()
                    
                    ],
                                               
                                               leadingActions: [
                                                
                                                Button{
                                                    presentationMode.wrappedValue.dismiss()
                                                }label: {
                                                    Text(AppTexts.close).foregroundStyle(.white)
                                                }.toAnyView()]
                )
                
                
                        PdfKitView(filePath: MockDataFile.samplePdf,rotationAngle: rotationAngle)
//
                
                
                Spacer()
            
        }
            .ignoresSafeArea()
    }
}

#Preview {
    PdfViewer(filePath: MockDataFile.samplePdf)
}
