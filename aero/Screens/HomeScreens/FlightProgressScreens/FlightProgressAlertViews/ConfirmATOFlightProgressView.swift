//
//  ConfirmATOFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 25/09/24.
//

import SwiftUI

struct ConfirmATOFlightProgressView: View {
    @State var showDatePopup : Bool = false;
    @State var selectedDate : Date = Date()
    
    let headingText : String = "Confirm ATO"
    let centerText : String = "Confirm actual time over waypoint:"
    @State var variableText : String = "-TOC-"
    
    let width : CGFloat = 300
    
    let bottomLineText : String = "ATO"
    
    var leftButtonText : String = "Cancel"
    var rightButtonText: String = "Confirm"
    
    var leftButtonFunction : () -> Void = {}
    var rightButtonFunction : () -> Void = {}
    var body: some View {
        ZStack{
            VStack{
                DarkText(text: headingText, font: AppFonts.dialogHeader, fontWeight: .bold)
                
                DarkText(text: centerText)
                
                itemSpacing()
                if(!variableText.isEmpty){
                    DarkText(text : variableText)
                }
                
                Rectangle()
                    .frame(width: width, height : 50)
                
                    .cornerRadius(10)
                    .foregroundStyle(.dWhite)
                    .overlay(
                        RoundedRectangle(cornerRadius: Dimensions.btnRadius)
                            .stroke(Color.black.opacity(0.7), lineWidth: 1)
                    )
                    .overlay(
                        HStack(spacing: 10){
                            DarkText(text: bottomLineText.uppercased(), font: AppFonts.dialogHeader, fontWeight: .bold)
                                .padding(CustomPadding.lPadding)
                            
                            HStack{
                                Spacer()
                                DarkText(text: "\(DateTimeFunctions.onlyTimeReadable(selectedDate)) Z",font: .system(size: 22))
                            }
                            .wrapInButton(action: {
                                showDatePopup = true
                            })
                            .popover(isPresented: $showDatePopup){
                                DatePicker("", selection: $selectedDate, displayedComponents: [.date,.hourAndMinute]
                                )
                                .datePickerStyle(.wheel)
                                .labelsHidden()
                            }
                            
                            Rectangle()
                                .frame(width: 102, height : 38)
                                .cornerRadius(10)
                                .padding(CustomPadding.vPadding)
                                .foregroundStyle(.alert)
                                .overlay(
                                    
                                    HStack(spacing:0){
                                        Button{
                                            selectedDate = Calendar.current.date(byAdding: .minute, value: -1, to: selectedDate) ?? selectedDate
                                        }label:{
                                            Rectangle()
                                                .frame(width: 50, height : 38)
                                                .cornerRadius(10)
                                                .foregroundStyle(.alert)
                                                .overlay(
                                                    VStack{
                                                        Image(systemName: SFIcons.minus)
                                                            .foregroundStyle(.mainBlue)
                                                    }
                                                    
                                                )
                                        }
                                        
                                        VerticalDivider(height: 20,color: .gray)
                                        
                                        Button{
                                            selectedDate = Calendar.current.date(byAdding: .minute, value: 1, to: selectedDate) ?? selectedDate
                                        }label:{
                                            Rectangle()
                                                .frame(width: 50, height : 38)
                                                .cornerRadius(10)
                                                .foregroundStyle(.alert)
                                                .overlay(
                                                    VStack{
                                                        Image(systemName: SFIcons.plus)
                                                            .foregroundStyle(.mainBlue)
                                                    }
                                                    
                                                )
                                        }
                                    }
                                )
                            CustomWidthSpacer(width: 4)
                        }
                        
                        
                    )
                
                HStack(spacing : 0) {
                    
                    Text(leftButtonText)
                        .fontWeight(.bold)
                        .font(AppFonts.largeText)
                        .foregroundColor(.mainBlue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.clear)
                        .roundedCorner(10, corners: [.bottomLeft])
                        .wrapInButton {
                            leftButtonFunction()
                        }
                    Spacer()
                    Text(rightButtonText)
                        .font(AppFonts.largeText)
                        .fontWeight(.regular)
                        .foregroundColor(.mainBlue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .roundedCorner(10, corners: [.bottomRight])
                        .background(.clear)
                        .wrapInButton {
                            rightButtonFunction()
                        }
                        
                    
                }
                .frame(width: width)
            }
        }
    }
}

#Preview {
    ConfirmATOFlightProgressView()
}
