//
//  HomeScreenViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 23/12/24.
//

import Foundation
import SwiftUI

class HomeScreenViewModel: ObservableObject{
    @Published var offset: CGFloat = Dimensions.sidebarWidth + 20
    @Published var isOffset: Bool = false
    @Published var currScreen: TopHomeScreenEnums = .avlFlightPlan
    @Published var currBottomScreen: BottomHomeScreenEnums = .defaultPage
    @Published var showQuickGuideSheet : Bool = false
    @Published var showLegalInfoSheet : Bool = false
    
    
    let quickGuideList: [UIImage] = [.qg1, .qg2, .qg3, .qg4, .qg5]
    @Published var quickGuideSelection : UIImage = .qg1
    
    func toggleOffset(){
        withAnimation{
            isOffset.toggle()
        }
    }
}
