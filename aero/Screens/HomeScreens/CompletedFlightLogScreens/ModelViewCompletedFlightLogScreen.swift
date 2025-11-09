//
//  ModelViewCompletedFlightLogScreen.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct ModelViewCompletedFlightLogScreen: View {
    var body: some View {
        VStack{
            HStack(){
                itemSpacingWidth()
                VStack(alignment: .leading){
                    LightBlackText(text: "NT106(NAY92V)")
                    LightBlueText(text: "Synced")
                }
                
                Spacer()
                VStack(alignment: .leading){
                    HStack{
                        LightBlackText(text: "GCXO - GCLP")
                        MediumBlueText(text: "(NAT HLA)")
                    }
                    
                    HStack{
                        LightBlackText(text: "ED 12 JUN 2024 11:14 Z | FMS S8987")
                            .opacity(0.5)
                    }
                    
                }
                Spacer()
                LightBlueText(text : "DOF 17 JUN 2024 07:01 Z")
                Spacer()
                Spacer()
            }
            .padding(EdgeInsets(top: Dimensions.topPadding, leading: Dimensions.leftPadding, bottom: Dimensions.bottomPadding, trailing: Dimensions.rightPadding))
            
            Divider()
        }
    }
}

#Preview {
    ModelViewCompletedFlightLogScreen()
}
