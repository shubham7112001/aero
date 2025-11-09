//
//  ChangePasswordScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/09/24.
//

import SwiftUI

struct ChangePasswordScreen: View {
    @State var currentPassword  : String = "";
    @State var newPassword  : String = "";
    @State var confirmPassword  : String = "";
    
    @State private var showAlert : Bool = false;
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack(spacing : 0){
                HeadingInternalScreenOfpScreen(leftText: "User", centerText: "Change password")
                
                ScrollView{
                    sectionSpacing()
                    
                    DividerWithActionsVstack(actions: [
                        TextWithFieldHStack(text: "Current password", input: $currentPassword).toAnyView(),
                        TextWithFieldHStack(text: "New password", input: $newPassword).toAnyView(),
                        TextWithFieldHStack(text: "Confirm password", input: $confirmPassword).toAnyView()
                    ])
                    
                    itemSpacing()
                    
                    Button{
                        if(currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty){
                            showAlert = true
                        }
                    }label:{
                        CenteredColorText(text: "Change password", color: .red)
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Missing account details"), message: Text("Please fill all fields"), dismissButton: .default(Text("OK")))
        })
        
    }
}

#Preview {
    ChangePasswordScreen()
}
