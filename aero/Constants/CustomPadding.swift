//
//  CustomPadding.swift
//  taillog
//
//  Created by Shubham Tiwari on 21/08/24.
//


import SwiftUI

class CustomPadding{
    
    static let defaultPadding: CGFloat = Dimensions.defaultPadding
    static let horizontal: CGFloat = Dimensions.spaceBwItems
    static let vertical: CGFloat = Dimensions.defaultPadding
    
    static let padding: EdgeInsets = EdgeInsets(top: CustomPadding.vertical, leading: CustomPadding.horizontal, bottom: CustomPadding.vertical, trailing: CustomPadding.horizontal)
    
    static let halfPadding: EdgeInsets = EdgeInsets(top: CustomPadding.vertical / 2, leading: CustomPadding.horizontal / 2, bottom: CustomPadding.vertical / 2, trailing: CustomPadding.horizontal / 2)

    static let vPadding: EdgeInsets = EdgeInsets(top: CustomPadding.vertical, leading: 0, bottom: CustomPadding.vertical, trailing: 0)
    static let hPadding: EdgeInsets = EdgeInsets(top: 0, leading: CustomPadding.horizontal, bottom: 0, trailing: CustomPadding.horizontal)
    
    static let vHalfPadding: EdgeInsets = EdgeInsets(top: CustomPadding.vertical / 2, leading: 0, bottom: CustomPadding.vertical / 2, trailing: 0)
    static let hHalfPadding: EdgeInsets = EdgeInsets(top: 0, leading: CustomPadding.horizontal / 2, bottom: 0, trailing: CustomPadding.horizontal / 2)
    
    static let tPadding: EdgeInsets = EdgeInsets(top: CustomPadding.defaultPadding, leading: 0, bottom: 0, trailing: 0)
    static let lPadding: EdgeInsets = EdgeInsets(top: 0, leading: CustomPadding.horizontal, bottom: 0, trailing: 0)
    static let bPadding: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: CustomPadding.defaultPadding, trailing: 0)
    static let rPadding: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: CustomPadding.horizontal)
    
    static let tHalfPadding: EdgeInsets = EdgeInsets(top: CustomPadding.defaultPadding / 2, leading: 0, bottom: 0, trailing: 0)
    static let lHalfPadding: EdgeInsets = EdgeInsets(top: 0, leading: CustomPadding.horizontal / 2, bottom: 0, trailing: 0)
    static let bHalfPadding: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: CustomPadding.defaultPadding / 2, trailing: 0)
    static let rHalfPadding: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: CustomPadding.horizontal / 2)
    
    static let none: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    static func tlbr(t: CGFloat? = nil, l: CGFloat? = nil, b: CGFloat? = nil, r: CGFloat? = nil) -> EdgeInsets {
        
        return EdgeInsets(top: t ?? 0, leading: l ?? 0, bottom: b ?? 0, trailing: r ?? 0)
        
   }
    
    static func hv(h: CGFloat? = nil, v: CGFloat? = nil) -> EdgeInsets {

        return EdgeInsets(top: v ?? 0, leading: h ?? 0, bottom: v ?? 0, trailing: h ?? 0)
        
    }

}
