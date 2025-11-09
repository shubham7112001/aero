//
//  CustomAlertManager.swift
//  taillog
//
//  Created by Shubham Tiwari on 05/12/24.
//

import SwiftUI
class CustomAlertManager: ObservableObject {
    static let shared = CustomAlertManager()
    
    @Published var isAlertPresented: Bool = false
    @Published var alertView: AnyView? = nil
    
    func showAlert<V: View>(view: V) {
            alertView = AnyView(view)
        withAnimation(.snappy){
            CustomDialogManager.shared.isDialogPresented = false
            isAlertPresented = true
        }
    }
    
    func dismissAlert() {
        isAlertPresented = false
        alertView = nil
    }
    
    func showAlert(title: String, message: String) {
        if let topController = getTopViewController() {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            topController.present(alert, animated: true, completion: nil)
        }
    }
        
    private func getTopViewController() -> UIViewController? {
        
        guard let windowScene = UIApplication.shared.connectedScenes
                    .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return nil
        }
            
        var topController = keyWindow.rootViewController
        
        while let presentedViewController = topController?.presentedViewController {
            topController = presentedViewController
        }
        
        return topController
    }
}
