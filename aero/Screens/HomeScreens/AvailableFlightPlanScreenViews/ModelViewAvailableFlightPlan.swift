//
//  AvailableFlightPlanModelView.swift
//  taillog
//
//  Created by Sword Software on 26/06/24.
//

import SwiftUI
import SwiftData

struct ModelViewAvailableFlightPlan : View {
     var flight : FlightsDB
    
    
    
    var body: some View {
        VStack{
            HStack(spacing : 0){
                
                HStack {
                    itemSpacingWidth()
                    
                    VStack{
                        LightBlackText(text: "NT224(IBB224)")
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                .frame(width: Dimensions.screenWidth * 0.25)
                
//                Spacer()
                HStack {
                    VStack(alignment : .leading){
                        LightBlackText(text: "\(flight.dep) - \(flight.dest)")
                        LightBlackText(text: "ED \(DateTimeFunctions.dateTimeReadable(flight.edited_at)) Z")
                            .opacity(0.5)
                    }
                    Spacer()
                    
                }
                .frame(width: Dimensions.screenWidth * 0.35)
                
//                Spacer()
                HStack {
                    VStack {
                        LightBlueText(text : "STD \(DateTimeFunctions.dateTimeReadable(flight.std)) Z")
                        
                        Spacer()
                    }
                    
                    Spacer()
                        
                }
                .frame(width: Dimensions.screenWidth * 0.3 )
                
                HStack{
                    Spacer()
                    
                    Image(.loadDownBlack)
                        .resizable()
                        .frame(width: 20, height: 30)
                        .scaledToFit()
                    
                    itemSpacingWidth()

                }.frame(width: Dimensions.screenWidth * 0.1 )
                
            }
            .padding(EdgeInsets(top: Dimensions.topPadding, leading: Dimensions.leftPadding, bottom: Dimensions.bottomPadding, trailing: Dimensions.rightPadding))
            
            Divider()
        }
    }
}

struct ModelViewAvailableFlightPlan_Previews: PreviewProvider {
    static var previews: some View {
        ModelViewAvailableFlightPlan(flight: FlightDbMockData.mockData[0])
    }
}
