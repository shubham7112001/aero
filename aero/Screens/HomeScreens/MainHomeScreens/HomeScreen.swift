//
//  HomeScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 19/12/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeScreenViewModel = HomeScreenViewModel()
    
    var body: some View {
        
        ZStack{
            
            Color(.bg)
            
            BottomHomeScreen(homeScreenViewModel: viewModel)
            
            TopHomeScreen(homeScreenViewModel: viewModel)
            
        }
    }
}

#Preview {
    HomeScreen()
}
