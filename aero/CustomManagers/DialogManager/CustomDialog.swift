//
//  CustomDialog.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/09/24.
//

import SwiftUI

struct CustomDialog: ViewModifier {
    
    @ObservedObject var presentationManager: DialogPresentation
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if presentationManager.isPresented {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.4))
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        presentationManager.hide()
                    }
                
                presentationManager.dialogContent?
                    .padding(CustomPadding.vPadding)
                    .background(.alert)
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
        }
    }
}
