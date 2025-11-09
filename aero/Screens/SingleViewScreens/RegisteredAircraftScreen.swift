//
//  RegisteredAircraftScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/09/24.
//

import SwiftUI

struct RegisteredAircraftScreen: View {
    var body: some View {
        SimpleBackButtonScreen(leftText: "User admin", centerText: "Registered aircraft",views:
                                VStack(spacing : 0){
            ScrollView {
                VStack(spacing : 0){
                    
                    ForEach(0..<50, id: \.self) { number in
                        VStack(spacing:0){
                            TextTextHStack(leftText: "DCMSL", rightText: "A321 / Airbus A321", leftOpacity: true, rightOpacity: true)
                            Divider().padding(CustomPadding.lPadding)
                        }
                        .background(.dWhite)
                        
                    }
                }
                
            }
        }
            .toAnyView()
    )
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisteredAircraftScreen()
}
