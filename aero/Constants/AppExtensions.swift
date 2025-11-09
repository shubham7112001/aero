//
//  AppExtensions.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/06/24.
//

import SwiftUI

extension String {
    func trim() -> String {
    return self.trimmingCharacters(in: .whitespaces)
   }
}



extension View {

    func toAnyView() -> AnyView {
        AnyView(self)
    }
    
    func wrapInButton(action: @escaping () -> Void) -> some View {
        Button(action: action){
            self
        }
        .buttonStyle(NoButtonStyle())
    }
    
    func customDialog(presentationManager: DialogPresentation) -> some View {
        self.modifier(CustomDialog(presentationManager: presentationManager))
    }
    
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
    
    public func formSheet<Content: View>(isPresented: Binding<Bool>,
                                          @ViewBuilder content: @escaping () -> Content) -> some View {
        self.background(FormSheet(show: isPresented,
                                  content: content))
    }
    
    public func customFlexSheet<Content: View>(isPresented: Binding<Bool>,
                                          @ViewBuilder content: @escaping () -> Content) -> some View {
        self.background(CustomFlexSheet(show: isPresented,
                                  content: content))
    }
    
    func ondipatchGesture(
        _ gesture: some Gesture,
        perform action: @escaping () -> Void
    ) -> some View {
        self.simultaneousGesture(gesture.onEnded { _ in
            DispatchQueue.main.async {
                action()
            }
        })
    }
    
    func customAlert<DialogContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> DialogContent
    ) -> some View {
        self.modifier(CustomAlert(isPresented: isPresented, dialogContent: content))
    }
}

extension Int{
    var toString : String{
        get {
            return String(self)
        }
    }
}
