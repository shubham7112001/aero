//
//  ResetPassword.swift
//  taillog
//
//  Created by Sword Software on 24/06/24.
//

import SwiftUI

struct ResetPassword: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var errorText = ""
    
    func onResetBtnClick(){
        email = ""
        errorText = ""
    }
    var body: some View {
        
        ZStack{
            Color(AppColors.mainColor)
            VStack{
                Spacer()
                logoImage()
                
                logoTrademark()
                
                Text(AppTexts.resetPassword)
                    .foregroundStyle(.white)
                    .font(.title2)
                
                AppErrorText(text: $errorText);
                
                textFieldView(binding: $email, text: AppTexts.email)
                
                itemSpacing()
                
                HStack{
                    
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        RoundedRectangularIcon(icon: "chevron.left")
                    }
                    
                    
                    simpleBtn(btnText: AppTexts.resetPassword)
                }
                .padding(.trailing, 50)
                
                sectionSpacing()
                
            
                Text(AppTexts.resetPasswordDescription)
                    .frame(width: Dimensions.btnWidth - 30)
                    .font(.caption2)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                Spacer()
            }
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        
        
    }
}

#Preview {
    ResetPassword()
}


