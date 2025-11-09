//
//  CustomManagerHandlerView.swift
//  taillog
//
//  Created by Shubham Tiwari on 19/12/24.
//

import SwiftUI

struct CustomManagerHandlerView: View {
    @StateObject private var alertManager = CustomAlertManager.shared
    @StateObject private var dialogManager = CustomDialogManager.shared
    
    var body: some View {
        ZStack {
            // Alert View
            if alertManager.isAlertPresented {
                CustomManagerView(
                    isPresented: alertManager.isAlertPresented,
                    onBackgroundTap: nil
                ) {
                    alertManager.alertView ?? AnyView(EmptyView())
                }
            }
            
            // Dialog View
            if dialogManager.isDialogPresented {
                CustomManagerView(
                    isPresented: dialogManager.isDialogPresented,
                    onBackgroundTap: {
                        dialogManager.dismissDialog()
                    }
                ) {
                    dialogManager.dialogView ?? AnyView(EmptyView())
                }
                
            }
        }
    }
}

#Preview {
    CustomManagerHandlerView()
}
