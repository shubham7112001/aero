//
//  ListSegmentedPicker.swift
//  taillog
//
//  Created by Shubham Tiwari on 05/09/24.
//

import Foundation
import SwiftUI
struct ListSegmentedPicker: View {
    var list: [String]
    var width: CGFloat?
    @Binding var selectedValue: String
    
    var body: some View {
        Picker("", selection: $selectedValue) {
            ForEach(list, id: \.self) { item in
                Text(item).tag(item)
            }
        }
        .frame(width : width ?? Dimensions.screenWidth * 0.3)
        .background(Color.gray)
        .cornerRadius(10)
        .padding(EdgeInsets(top: Dimensions.topPadding, leading: Dimensions.leftPadding, bottom: Dimensions.bottomPadding, trailing: Dimensions.rightPadding))
        .pickerStyle(.segmented)
    }
}
