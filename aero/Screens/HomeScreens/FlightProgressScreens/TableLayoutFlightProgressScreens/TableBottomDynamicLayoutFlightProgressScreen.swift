//
//  TableBottomStaticLayoutFlightProgressScreen.swift
//  taillog
//
//  Created by Sword Software on 28/06/24.
//

import SwiftUI

struct TableBottomDynamicLayoutFlightProgressScreen: View {
    @ObservedObject var viewModel: FlightProgressViewModel

    var body: some View {
        VStack{
            ScrollViewReader{scrollValue in
                ScrollView{
                    VStack(spacing: 0){
                        ForEach(StaticModelDataFlightProgressScreen.mockData.indices, id: \.self){ index in
                            
                            VStack(spacing: 0){
                                ModelViewFlightProgressScreen(bgColor: index % 2 == 1 ? .white : .veryLightGrey, isSelected: viewModel.registerFlightProgressSelectedIdx == index ? true : false, model: StaticModelDataFlightProgressScreen.mockData[index], textColor: index < 5 ? .black : .mainBlue)
                                
                                
                                if(index % 12 == 4){Divider().frame(height: 1).background(.black)}
                            }
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded {
                                        viewModel.registerFlightProgressOnTap(index)
                                        viewModel.dialogManager.onDismiss = {
                                            withAnimation(.easeIn){
                                                scrollValue.scrollTo(viewModel.registerFlightProgressSelectedIdx)
                                            }
                                        }
                                    }
                            )
                            
                        }
                    }
                    
                }
            }
        }
        .padding(0)
    }
    
    
}

//#Preview {
//    TableBottomDynamicLayoutFlightProgressScreen()
//}
