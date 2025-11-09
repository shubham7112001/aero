//
//  CompanyDocumentsScreen.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct CompanyDocumentsScreen: View {
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color(.appBar)
                
                VStack{
                    AppBarCompanyDocumentsScreen(isOffset: $homeScreenViewModel.isOffset)
                     
                    ZStack{
                        Color(.white)
                        VStack{
                            ScrollView{
                                ForEach(0..<30){index in
                                    ModelViewCompanyDocumentsScreen()
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
    CompanyDocumentsScreen(homeScreenViewModel: HomeScreenViewModel())
}
