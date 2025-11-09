//
//  LoginScreen.swift
//  taillog
//
//  Created by Sword Software on 24/06/24.
//

import SwiftUI



struct LoginScreen: View {
    @Environment(\.modelContext) var modelContext
    @State private var email = "shivani@ssntpl.com"
    @State private var password = "password"
    
    @State private var errorText = ""
    
    @State private var goToResetPassword = false;
    @State private var goToHome = false;
    
    @State private var isLoader = false;
    
    @State private var showAlert = false;
    @State private var alertMessage = "";
    
    @State private var showErrorView = false;
    
    func showErrorActivation() {
        showErrorView = true;
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            withAnimation{
                self.showErrorView = false
            }
        }
    }
    
    func onLoginBtnClick() async {
        let emailText = email
        let passwordText = password
        
        email = ""
        password = ""
        
        isLoader = true;
        if(emailText.isEmpty || passwordText.isEmpty){
            if(emailText.isEmpty && passwordText.isEmpty){
                errorText = "Email and password is required"
            }
            else if emailText.isEmpty{
                errorText = "Email can't be empty"
            }
            else {
                errorText = "Password can't be empty"
            }
            
            showErrorActivation()
        }
        else if !AppRegex.isValidEmail(emailText){
            errorText = "Please enter a valid email"
            
            showErrorActivation()
        }
        else{
            let result = await ApiCallManager.login(email: emailText.trim(), password: passwordText.trim(), modelContext: modelContext)
            
            if(result == AppTexts.success){
                
                 let biometricIDAuth = BiometricIDAuth()
                
                biometricIDAuth.canEvaluate { (canEvaluate, _, canEvaluateError) in
                    guard canEvaluate else {
                        // Face ID/Touch ID may not be available or configured
                        return
                    }
                    
                    biometricIDAuth.evaluate {(success, error) in
                        guard success else {
                            // Face ID/Touch ID may not be configured
                            return
                        }
                        
                        self.goToHome = true
                    }
                }
            }
            else{
                alertMessage = result
                showAlert = true;
                print(result)
                
            }
        }
        isLoader = false;
    }
    

    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(AppColors.mainColor)
                VStack{
                    Spacer()
                    logoImage()
                    
                    logoTrademark()
                    
                    if showErrorView  {
                        AppErrorText(text: $errorText)
                    }
                    
                    ZStack{
                        Rectangle()
                            .frame(width: Dimensions.btnWidth, height: (Dimensions.btnHeight * 2)+2)
                            .cornerRadius(5)
                            .foregroundStyle(.white)
                        
                        VStack(spacing:0){
                            
                            textFieldView(binding: $email, text: AppTexts.email)
                            
                            
                            Divider()
                                .frame(width: Dimensions.btnWidth, height: 2)
                                .foregroundStyle(.black)
                            
                            textFieldView(binding: $password, text: AppTexts.password)
                        }
                    }
                    .padding(CustomPadding.padding)
                    
                    Button{
                        Task{
                            await onLoginBtnClick()
                        }
                    }label: {
                        simpleBtn(btnText: AppTexts.login)
                    }
                    
                    Spacer()
                    
                    Button{
                        self.goToResetPassword = true
                    }label: {
                        borderBtn(text: AppTexts.resetPassword)
                    }
                    
                    Spacer()
                    
                    
                }
                
                if isLoader {
                    VStack {
                        // Loader
                        Spacer()
                        HStack{
                            Spacer()
                        }
                        
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)
                            .shadow(radius: 10)
                        Spacer()
                    }
                    .transition(.move(edge: .top))
                    .animation(.easeInOut, value: isLoader)
                    .frame(width: Dimensions.screenWidth, height: Dimensions.screenHeight)
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
            .navigationDestination(
                isPresented: $goToResetPassword,
                destination: {
                    ResetPassword()
                }
            )
            .navigationDestination(isPresented: $goToHome, destination: {
                HomeScreen()
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            })
            
        }
    }
}

#Preview {
    LoginScreen()
}
