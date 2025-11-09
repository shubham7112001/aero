//
//  CustomAlert.swift
//  taillog
//
//  Created by Shubham Tiwari on 29/08/24.
//

import Foundation
import SwiftUI

//class CustomAlert{
//    static func customAlert(title: String,
//                         message: String,
//                         primaryButtonTitle: String,
//                         primaryButtonAction: @escaping () -> Void,
//                         secondaryButtonTitle: String,
//                         secondaryButtonAction: @escaping () -> Void) -> Alert {
//            Alert(
//                title: Text(title),
//                message: Text(message),
//                primaryButton: .default(Text(primaryButtonTitle), action: primaryButtonAction),
//                secondaryButton: .cancel(Text(secondaryButtonTitle), action: secondaryButtonAction)
//            )
//        }
//}


struct CustomAlert<DialogContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let dialogContent: () -> DialogContent

    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: isPresented ? 3 : 0) // Blur the background when the alert is visible

            if isPresented {
                // Darkened background
                Color.black.opacity(0.4)
                    .ignoresSafeArea()

                // Alert container
                VStack {
                    dialogContent()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 10)
                .transition(.scale)
            }
        }
        .animation(.easeInOut, value: isPresented)
    }
}
