//
//  CompltedFlightLogScreen.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct CompletedFlightLogScreen: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color(.appBar)
                
                VStack{
                    AppBarCompletedFlightLogScreen(isOffset: $homeScreenViewModel.isOffset)
                     
                    ZStack{
                        Color(.white)
                        VStack{
                            ScrollView{
                                ForEach(0..<30){index in
                                    ModelViewCompletedFlightLogScreen()
                                }
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    CompletedFlightLogScreen(homeScreenViewModel: HomeScreenViewModel())
}
