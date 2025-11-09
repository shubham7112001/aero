//
//  DialongPresentation.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/09/24.
//

import SwiftUI

final class DialogPresentation: ObservableObject {
    @Published var isPresented = false
    @Published var dialogContent: AnyView?
    
    func show<Content: View>(@ViewBuilder content: () -> Content) {
        dialogContent = AnyView(content())
        isPresented = true
    }
    
    func hide() {
        isPresented = false
    }
}
