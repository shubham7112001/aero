//
//  MainScreenn.swift
//  taillog
//
//  Created by Sword Software on 25/06/24.
//

import SwiftUI
import SwiftData


struct AvailableFlightPlanScreen: View {
    @State private var selectedDurationSegment: AvailableFlightPlanDurationSegment = AvailableFlightPlanDurationSegment.all[2]
    @State private var selectedFlightSegment: AvailableFlightPlanFlightSegment = AvailableFlightPlanFlightSegment.all[2]
    @State private var newSegment: AvailableFlightPlanNewSegment = AvailableFlightPlanNewSegment.all[0]
    
    @State private var searchText: String = ""
    @State private var moveToOfpScreen : Bool = false
    
    
    @Query var flights : [FlightsDB]
    @State private var filteredFlights : [FlightsDB] = []
    
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.appBar)
                
                VStack{
                    AppBarAvailableFlightPlanScreen(isOffset: $homeScreenViewModel.isOffset, moveToOfpScreen: $moveToOfpScreen)
                    Spacer()
                    ZStack{
                        Color(.white)
                        VStack{
                            ZStack{
                                Rectangle()
                                    .frame(height: Dimensions.segmentBgHeight)
                                    .foregroundColor(Color(AppColors.lightGreyColor))
                                HStack(spacing : 0){
                                    
                                    AppSegmentedPicker(selectedItem: $newSegment, items: AvailableFlightPlanNewSegment.all, width:  Dimensions.screenWidth * 0.08)
                                    
                                    AppSegmentedPicker(selectedItem: $selectedDurationSegment, items: AvailableFlightPlanDurationSegment.all, width:  Dimensions.screenWidth * 0.32)
                                    
                                    AppSegmentedPicker(selectedItem: $selectedFlightSegment, items: AvailableFlightPlanFlightSegment.all, width:  Dimensions.screenWidth * 0.4)
                                    
                                    searchTextField(text: $searchText).frame(width: Dimensions.screenWidth * 0.1)
                                }
                                .frame(height: Dimensions.segmentBgHeight)
                            }
                            ScrollView{
                                if(!filteredFlights.isEmpty){
                                    
                                    ForEach(filteredFlights.indices,id: \.self){index in
                                            ModelViewAvailableFlightPlan(flight: filteredFlights[index])
                                    }
                                    
                                }
                                
                                else{
                                    ForEach(0..<30){_ in
                                        VStack{
                                            Divider()
                                        }
                                        .frame(height:50)
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                }
                
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $moveToOfpScreen, destination: {
            OfpScreen()
        })
        .onAppear(){
            updateFilteredFlights()
        }
        .onChange(of: selectedFlightSegment){
            updateFilteredFlights()
        }
        .onChange(of: selectedDurationSegment){
            updateFilteredFlights()
        }
        .ignoresSafeArea()
        
    }
    
    func updateFilteredFlights (){
        filteredFlights = flights.filter { showData($0) }
    }
    
    func showData(_ flight : FlightsDB) -> Bool{
        var isInDuration  : Bool = false;
        var isInFlight  : Bool = false;
        
        switch selectedDurationSegment {
        case AvailableFlightPlanDurationSegment.all[0]:
            if DateTimeFunctions.differenceInHours(from: flight.std) <= 6 {
                isInDuration = true
            }
        case AvailableFlightPlanDurationSegment.all[1]:
            if DateTimeFunctions.differenceInHours(from: flight.std) <= 24 {
                isInDuration = true
            }
        case AvailableFlightPlanDurationSegment.all[2]:
            isInDuration = true
        default:
            isInDuration = false
        }

        switch selectedFlightSegment {
        case AvailableFlightPlanFlightSegment.all[0]:
            if DateTimeFunctions.differenceInHours(from: flight.std) <= 6 {
                isInFlight = true
            }
        case AvailableFlightPlanFlightSegment.all[1]:
            if DateTimeFunctions.differenceInHours(from: flight.std) <= 24 {
                isInFlight = true
            }
        case AvailableFlightPlanFlightSegment.all[2]:
            isInFlight = true
        default:
            isInFlight = false
        }

        
        if(isInDuration && isInFlight){
            return true
        }
        
        return false;
    }
}

#Preview {
    AvailableFlightPlanScreen(homeScreenViewModel: HomeScreenViewModel())
}




