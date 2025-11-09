//
//  DocumentsMessagesDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct DocumentsMessagesDetailScreenOfpScreen: View {
    
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack(spacing : 0){
                HeadingTextNavigationSplitView(text: AppTexts.documentsMessages)
                
                ScrollView{
                    sectionSpacing()
                    
                    CapitalizedTextHalfOpacity(text: "DISPATCH MESSAGE")
                    
                    LeftColoredText(text: "SWISS PRIVATE JET DEMO",color: .gray)
                    
                    itemSpacing()
                    
                    VStack(spacing : 2){
                        
                        PdfViewerRow(text: "Route Specific PaxInfo Chart",actions: [
                            IconImage(content: .systemImage(SFIcons.rightChevron),color: Color.gray).toAnyView()
                        ])
                        
                        HorizontalDividerDetailScreenNavigationSplitView(multiple: Dimensions.dividerContentSpacing)
                        
                        PdfViewerRow(text: "Flight Log",actions: [
                            IconImage(content: .systemImage(SFIcons.rightChevron),color: Color.gray).toAnyView()
                        ])
                        
                        HorizontalDividerDetailScreenNavigationSplitView(multiple: Dimensions.dividerContentSpacing)
                        
                        PdfViewerRow(text: "Flight Messages",actions: [
                            IconImage(content: .systemImage(SFIcons.rightChevron),color: Color.gray).toAnyView()
                        ])
                        
                        HorizontalDividerDetailScreenNavigationSplitView(multiple: Dimensions.dividerContentSpacing)
                        
                        PdfViewerRow(text: "ATC Flight Plan",actions: [
                            IconImage(content: .systemImage(SFIcons.rightChevron),color: Color.gray).toAnyView()
                        ])
                        
                        HorizontalDividerDetailScreenNavigationSplitView(multiple: Dimensions.dividerContentSpacing)
                        
                        PdfViewerRow(text: "Short ATC Flight Plan",actions: [
                            IconImage(content: .systemImage(SFIcons.rightChevron),color: Color.gray).toAnyView()
                        ])
                        
                    }
                    .background(.white)

                    
                    
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    DocumentsMessagesDetailScreenOfpScreen()
}
