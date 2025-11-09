//
//  SingleItemSelectionScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/09/24.
//

import SwiftUI

struct SingleItemSelectionScreen: View {
    var leftText : String = "Back"
    var centerHeadingText : String
    var itemsList : [String]
    @State var selectedItem : String?
    var body: some View {
        SimpleBackButtonScreen(leftText : leftText, centerText: centerHeadingText, views:
                                ScrollView{
            SingleItemSelectionView(itemsList: itemsList)
            }
            .navigationBarBackButtonHidden()
            .toAnyView())
    }
}

#Preview {
    SingleItemSelectionScreen(centerHeadingText: "center text", itemsList: ["hi","bye","ho","gaya","chalo","niklo","yahan","se"])
}
