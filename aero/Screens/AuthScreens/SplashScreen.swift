//
//  SplashScreen.swift
//  taillog
//
//  Created by Sword Software on 24/06/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false;
    let internet = NetworkMonitor.shared
    var body: some View {
        NavigationStack{
            VStack{
                Image(.splashPortraitOld)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $isActive, destination: {
                LoginScreen()
            })
        }
    }
     
}

#Preview {
    SplashScreen()
}
