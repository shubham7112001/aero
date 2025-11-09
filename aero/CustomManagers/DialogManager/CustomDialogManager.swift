//
//  CustomDialogManager.swift
//  taillog
//
//  Created by Shubham Tiwari on 17/12/24.
//

import SwiftUI

class CustomDialogManager: ObservableObject{
    static let shared = CustomDialogManager()
    
    @Published var isDialogPresented : Bool = false
    @Published var dialogView : AnyView? = nil
    @Published var onDismiss :  () -> Void = {}
    
    func showDialog<V: View>(view: V){
        CustomAlertManager.shared.isAlertPresented = false
        dialogView = AnyView(view)
        isDialogPresented = true
    }
    
    func dismissDialog(){
        isDialogPresented = false
        dialogView = nil
        onDismiss()
    }
}
