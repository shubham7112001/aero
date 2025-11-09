//
//  SwiftUIView.swift
//  taillog
//
//  Created by Shubham Tiwari on 11/12/24.
//

import SwiftUI

struct ReferenceWaypointReroutingSheet: View {
    @EnvironmentObject var reroutingViewModel : ReroutingRoutesViewModel
    
    let data : [String] = [
        "Recursion", "is", "a", "programming", "concept", "that", "can", "be", "quite", "tr",
        "Abstraction", "is", "an", "important", "object", "oriented", "programming", "concept",
        "Data", "structures", "play", "a", "key", "role", "in", "optimizing", "algorithm", "efficiency",
        "Asynchronous", "programming", "enables", "efficient", "concurrent", "tasks",
        "Dependency", "injection", "helps", "decouple", "code", "for", "easier", "te",
        "Functional", "programming", "is", "a", "programming", "paradigm", "using", "funct",
        "Object", "oriented", "programming", "encourages", "code", "reuse", "and",
        "Big", "data", "technologies", "handle", "massive", "data", "sets", "with", "sca",
        "Machine", "learning", "models", "require", "training", "on", "large", "dat",
        "Cloud", "computing", "allows", "on-demand", "access", "to", "shared", "co"
      ]
    
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack(spacing: 0){
                VStack{
                    itemSpacing()
                    SheetHeadingView(heading: "Reference waypoint", cancelText: "Rerouting", cancelFunction: {
                        reroutingViewModel.currentReroutes = .mainPage
                    }, isLeftIconEnable: true)
                }
                .frame(height: 70)
                .background(Color.white.opacity(0.9))
                
                Divider()
                
                ScrollView{
                    VStack{
                        itemSpacing()
                        
                        SingleItemSelectionView(itemsList: data)
                            .background(.red)
                    }
                }
                Spacer()
            }
        }
        .frame(width: Dimensions.customSheetWidth, height: Dimensions.customSheetHeight)
    }
}

#Preview {
    ReferenceWaypointReroutingSheet()
}
