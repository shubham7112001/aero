//
//  CustomManagerView.swift
//  taillog
//
//  Created by Shubham Tiwari on 19/12/24.
//

import SwiftUI

struct CustomManagerView: View {
    let isPresented: Bool
    let onBackgroundTap: (() -> Void)?
    let content: () -> AnyView
    
    var body: some View {
        if isPresented {
            ZStack {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        onBackgroundTap?()
                    }
                
                VStack {
                    content()
                }
            }
            .zIndex(1)
        }
    }
}
