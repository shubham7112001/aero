//
//  TableMediumStaticLayoutFlightProgressScreen.swift
//  taillog
//
//  Created by Sword Software on 28/06/24.
//

import SwiftUI

struct TableMediumStaticLayoutFlightProgressScreen: View{
    var body : some View{
        ZStack{
            Color(.mainBlue)
            ModelViewFlightProgressScreen(isBlack: false, bgColor: .mainBlue)
        }
        .frame(height: Dimensions.flightProgressTableRowHeight)
    }
}

#Preview {
    TableMediumStaticLayoutFlightProgressScreen()
}
