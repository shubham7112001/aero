//
//  UrlOpening.swift
//  taillog
//
//  Created by Shubham Tiwari on 20/12/24.
//

import SwiftUI

class UrlOpening{
    
    func openWebsite(_ urlString: String) {
        
        if !NetworkMonitor.shared.isConnected {
            CustomAlertManager.shared.showAlert(title: "No Network", message: "Please check your network connection and try again.")
            return
        }
        
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else {
            CustomAlertManager.shared.showAlert(title: "Invalid URL", message: "The URL you provided is not valid.")
            return
        }
        
        UIApplication.shared.open(url, options: [:]) { success in
            if success {
                print("Successfully opened the URL.")
            } else {
                CustomAlertManager.shared.showAlert(title: "Failed", message: "Failed to open the URL: \(urlString)")
            }
        }
    }
}
