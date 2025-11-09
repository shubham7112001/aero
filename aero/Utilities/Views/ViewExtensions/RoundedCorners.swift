//
//  RoundedCorners.swift
//  taillog
//
//  Created by Shubham Tiwari on 02/12/24.
//

import SwiftUI

struct RoundedCorners: Shape {
    var tl: CGFloat // Top-left corner radius
    var tr: CGFloat // Top-right corner radius
    var bl: CGFloat // Bottom-left corner radius
    var br: CGFloat // Bottom-right corner radius
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect,
                            cornerSize: CGSize(width: tl, height: tl),
                            style: .continuous) // Add rounded corners for the top-left and top-right corners
        return path
    }
}
