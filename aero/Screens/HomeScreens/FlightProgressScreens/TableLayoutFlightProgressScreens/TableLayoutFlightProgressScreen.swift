//
//  TableLayoutFlightProgressScreen.swift
//  taillog
//
//  Created by Sword Software on 28/06/24.
//

import SwiftUI



struct TableLayoutFlightProgressScreen: View {
    
    @ObservedObject var viewModel : FlightProgressViewModel
    
    var body: some View {
        
        
        ZStack{
            Color(.white)
            
            VStack(spacing : 0){
                
                TableTopStaticLayoutFlightProgressScreen()
                
                TableMediumStaticLayoutFlightProgressScreen()
                
                TableBottomDynamicLayoutFlightProgressScreen(viewModel: viewModel)
                
            }
            .frame(width: Dimensions.screenWidth)
        }
        
        
        
    }
}











