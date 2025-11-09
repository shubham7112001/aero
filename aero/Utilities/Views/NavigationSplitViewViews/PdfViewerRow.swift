//
//  RectIconTextDetailViewNavSplitView.swift
//  taillog
//
//  Created by Shubham Tiwari on 11/07/24.
//

import SwiftUI

struct PdfViewerRow: View {
    var text: String
    var content : IconImageContent = .customImage(Image(.confMenuCompDoc))
    var size : CGFloat =  30
    var isTextWhite : Bool = false
    var bg : Color = Color.main
    var cornerRadii : CGFloat = 5
    var bgColor : UIColor = UIColor.white
    
    var actions : [AnyView] = []
    @State var showDocs : Bool = false;
    
    var body: some View {
        ZStack{
            Color(bgColor)
            HStack(alignment: .top, spacing: 0){
                itemSpacingWidth()
                Rectangle()
                    .fill(bg)
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadii)
                    .overlay(
                        IconImage(content: content)
                        )
                itemSpacingWidth()
                DarkText(text: text, isBlack: !isTextWhite)
                    .padding(.top, 4)
                
                Spacer()
                
                ForEach(actions.indices,id : \.self){index in
                    HStack{
                        actions[index]
                            .padding(.top, 4)
                    }
                }
                
                itemSpacingWidth()
            }
            .padding(CustomPadding.vPadding)
        }
        .fullScreenCover(isPresented: $showDocs, content: {
            PdfViewer(filePath: MockDataFile.samplePdf)
        })
        .onTapGesture {
            showDocs = true;
        }
        .frame(height: Dimensions.defaultRowHeight)
        .background(Color(bgColor))
    }
}

#Preview {
    PdfViewerRow(text: "Data is important", content: .customImage(Image(.confMenuCompDoc)))
}
