//
//  logoTrademark.swift
//  taillog
//
//  Created by Sword Software on 24/06/24.
//

import SwiftUI

struct logoTrademark: View {
    var body: some View {
        VStack{
            Image(.appinfoLogo)
                .resizable()
                .scaledToFill()
                
                
        }
        .padding(.top, 20)
        .frame(width: 220,height: 70)
    }
}

#Preview {
    logoTrademark()
}
