//
//  ImageStaticRow.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct ImageSelectionStaticRow: View {
    var text : String
    var addedText : String = "Added"
    @State var isImagePresent: Bool
    var isOpacity : Bool = false;
    
    var body: some View {
        VStack{
                TextWithActions(text: text, actions: [
                    
                    Text(addedText)
                        .foregroundStyle(.gray)
                        .toAnyView(),
                    
                    Image(systemName: SFIcons.cameraFill)
                        .opacity(AppConstants.defaultOpacity)
                        .foregroundStyle(.gray)
                        .toAnyView(),
                    
                    Image(systemName: SFIcons.rightChevron)
                        .foregroundStyle(.gray)
                        .opacity(AppConstants.defaultOpacity)
                        .toAnyView()
                ], isOpacity:  isOpacity)
            
        }
    }
}

#Preview {
    ImageSelectionStaticRow(text : "Checklist item", isImagePresent: true)
}
