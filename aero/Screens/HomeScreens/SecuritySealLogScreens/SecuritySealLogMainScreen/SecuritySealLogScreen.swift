//
//  SecuritySealLogScreen.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI

struct SecuritySealLogScreen: View {
    
    @State private var searchText : String = ""
    
    @State private var statusSegment : SecuritySealLogStatusSegment = SecuritySealLogStatusSegment.all[0];
    @State private var flightSegment : SecuritySealLogFlightSegment = SecuritySealLogFlightSegment.all[0];
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color(.appBar)
                
                VStack{
                    AppBarSecuritySealLogScreen(isOffset: $homeScreenViewModel.isOffset)
                    
                    ZStack{
                        Rectangle()
                            .frame(height: Dimensions.segmentBgHeight)
                            .foregroundColor(Color(AppColors.lightGreyColor))
                        HStack{
                            
                            AppSegmentedPicker(selectedItem: $statusSegment, items: SecuritySealLogStatusSegment.all,width: Dimensions.screenSize.width * 0.45)
                            
                            AppSegmentedPicker(selectedItem: $flightSegment, items: SecuritySealLogFlightSegment.all,width: Dimensions.screenSize.width * 0.25)
                            
                            SearchBar(text: $searchText)
                        }
                        .frame(height: Dimensions.segmentBgHeight)
                    }
                    
                    ZStack{
                        Color(.white)
                        VStack{
                            ScrollView{
                                ForEach(0..<30){index in
                                    ModelViewSecuritySealLog()
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
    SecuritySealLogScreen(homeScreenViewModel: HomeScreenViewModel())
}
