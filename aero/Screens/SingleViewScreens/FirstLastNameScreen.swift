//
//  FirstLastNameScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/09/24.
//

import SwiftUI

struct FirstLastNameScreen: View {
    @State var firstName : String = ""
    @State var lastName : String = ""
    var body: some View {
        VStack{
            SimpleBackButtonScreen(leftText : "User", centerText: "Name", views: VStack(spacing:0){
                
                TextWithFieldHStack(text: "First name", input: $firstName)
                
                Divider().padding(CustomPadding.lPadding)
                
                TextWithFieldHStack(text: "Last name", input: $lastName)
                
            }
                .background(.dWhite)
                .toAnyView())
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FirstLastNameScreen()
}
