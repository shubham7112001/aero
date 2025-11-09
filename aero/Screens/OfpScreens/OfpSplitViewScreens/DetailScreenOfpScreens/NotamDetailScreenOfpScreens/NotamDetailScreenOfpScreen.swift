//
//  NotamDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct NotamDetailScreenOfpScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedSegment : NotamSegmentTextOfpScreen  = NotamSegmentTextOfpScreen.all[0];
    
    @State private var allFirSelection : AllFirWheelPickerDataNotamDetailScreenOfpScreens = AllFirWheelPickerDataNotamDetailScreenOfpScreens.all[0];
    @State private var anyAgeSelection : AnyAgeWheelPickerDataNotamDetailScreenOfpScreens = AnyAgeWheelPickerDataNotamDetailScreenOfpScreens.all[0];
    @State private var noKeywordFilterSelection : NoKeywordFilterWheelPickerDataNotamDetailScreenOfpScreens = NoKeywordFilterWheelPickerDataNotamDetailScreenOfpScreens.all[0];
    
    @State private var allFirPopUp : Bool = false;
    @State private var anyAgePopUp : Bool = false;
    @State private var noKeyWordPopUp : Bool = false;
    
    @State private var appBarText : String = "PM1TL DEMO : LSGG-LTFM : 15 JUL 2024 11:00 Z"
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack(spacing : 0){
                ZStack{
                    Color(.bg)
                    Text(appBarText)
                        .foregroundStyle(.white)
                        .padding(CustomPadding.tPadding)
                }
                .frame(height: Dimensions.appBarHeight * 1.5)
                HeadingTextNavigationSplitView(text: AppTexts.notam, leadingActions: [
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Text(AppTexts.close).foregroundStyle(.white)
                    }.toAnyView()
                    
                ])
                
                AppSegmentedPicker(selectedItem: $selectedSegment, items: NotamSegmentTextOfpScreen.all, width: Dimensions.screenWidth  * 0.75)
                    .padding(CustomPadding.padding)
                
                HStack{
                    
                    Button{
                        allFirPopUp = true;
                    }label: {
                        RectangularChip(text: "All FIR")
                    }
                    .popover(isPresented: $allFirPopUp, content: {
                        VStack{
                            AppWheelPicker(selectedItem: $allFirSelection, items: AllFirWheelPickerDataNotamDetailScreenOfpScreens.all)
                            CustomHeightSpacer(height: Dimensions.screenWidth * 0.05)
                        }
                            .frame(width: Dimensions.pickerPopupWidth,height: Dimensions.pickerPopupHeight)
                    })
                    
                    
                    
                    Button{
                        anyAgePopUp = true;
                    }label: {
                        RectangularChip(text: "Any age")
                    }
                    .popover(isPresented: $anyAgePopUp, content: {
                        VStack{
                            AppWheelPicker(selectedItem: $anyAgeSelection, items: AnyAgeWheelPickerDataNotamDetailScreenOfpScreens.all)
                            CustomHeightSpacer(height: Dimensions.screenWidth * 0.05)
                        }
                            .frame(width: Dimensions.pickerPopupWidth,height: Dimensions.pickerPopupHeight)
                    })
                    
                    Button{
                        noKeyWordPopUp = true
                    }label: {
                        RectangularChip(text: "No keyword filter")
                    }
                    .popover(isPresented: $noKeyWordPopUp, content: {
                        VStack{
                        AppWheelPicker(selectedItem: $noKeywordFilterSelection, items: NoKeywordFilterWheelPickerDataNotamDetailScreenOfpScreens.all)
                            
                            
                            CustomHeightSpacer(height: Dimensions.screenWidth * 0.05)
                        }
                            .frame(width: Dimensions.pickerPopupWidth,height: Dimensions.pickerPopupHeight)
                    })
                    
                    
                    
                    
                }
                .padding(CustomPadding.padding)
                
                ScrollView{
                    VStack(spacing : 0){
                        ForEach(0..<10){index in
                            HStack{
                                VStack(alignment : .leading){
                                    Text("SX35/24\nSX0035/24 AIP SUPPLEMENT\nGCFV/FUERTEV\nPRKG H7 AND H8 U/S.")
                                }
                                Spacer()
                                VStack(alignment : .trailing){
                                    Text("AIRPORT")
                                    Text("113")
                                        .opacity(AppConstants.defaultOpacity)
                                }
                            }
                            .padding(CustomPadding.padding)
                            .background(.white)
                            Divider()
                            
                        }
                    }
                    
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NotamDetailScreenOfpScreen()
}
