//
//  IconTextDetailSplitNavigationView.swift
//  taillog
//
//  Created by Shubham Tiwari on 09/07/24.
//

import SwiftUI

struct IconTextDetailSplitNavigationView: View {
    var text : String
    var body: some View {
        IconTextHStack(text: text,isPaddingLeft: false)
            .background(.white)
    }
        
}

//#Preview {
//    IconTextDetailSplitNavigationView(text : "Hello World")
//}
