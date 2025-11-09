//
//  CheckListSinglePhoto.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/09/24.
//

import SwiftUI

struct CheckListSinglePhoto: View {
    var text : String
    @State var selectedImage : UIImage? = nil
    var isApplicable : Bool 
    var body: some View {
        ImageSelectionRow(text: text, selectedImage: $selectedImage,isApplicable: isApplicable)
    }
}

#Preview {
    CheckListSinglePhoto(text : "Text shown here",isApplicable: true)
}
