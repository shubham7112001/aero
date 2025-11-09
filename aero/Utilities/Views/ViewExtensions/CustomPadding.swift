//
//  CustomPadding.swift
//  taillog
//
//  Created by Shubham Tiwari on 14/08/24.
//

import SwiftUI

extension View {
    func customPadding(
        horizontal: CGFloat = Dimensions.spaceBwItems,
        vertical: CGFloat = Dimensions.defaultPadding,
        top: CGFloat? = nil,
        leading: CGFloat? = nil,
        trailing: CGFloat? = nil,
        bottom: CGFloat? = nil,
        edgeInsets: EdgeInsets? = nil
    ) -> some View {
        self.modifier(CustomPadding(
            horizontal: horizontal,
            vertical: vertical,
            top: top,
            leading: leading,
            trailing: trailing,
            bottom: bottom,
            edgeInsets: edgeInsets
        ))
    }
}



struct CustomPadding: ViewModifier {
    var horizontal: CGFloat
    var vertical: CGFloat
    var top: CGFloat?
    var leading: CGFloat?
    var trailing: CGFloat?
    var bottom: CGFloat?
    var edgeInsets: EdgeInsets?

    func body(content: Content) -> some View {
        content
            .padding(.top, top ?? edgeInsets?.top ?? vertical)
            .padding(.leading, leading ?? edgeInsets?.leading ?? horizontal)
            .padding(.trailing, trailing ?? edgeInsets?.trailing ?? horizontal)
            .padding(.bottom, bottom ?? edgeInsets?.bottom ?? vertical)
    }
}

