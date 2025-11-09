//
//  CustomAlertPopover.swift
//  taillog
//
//  Created by Shubham Tiwari on 04/12/24.
//

import SwiftUI

struct CustomAlertDateSelection: View {
    
    @State var showDatePopup : Bool = false;
    @State var selectedDate : Date = Date()
    
    var headingStaticText : String = "Heading Text"
    var centerTopText : String = ""
    var centerBottomText : String = ""
    @State var resultant : String = ""
    
    var width : CGFloat = 250
    
    var boldText : String = "Bold"
    
    var leftBtnText : String = "Cancel"
    var rightBtnText: String = "Cancel"
    
    var leftBtnAction : () -> Void = {}
    var rightBtnAction : () -> Void = {}

    var isTextField : Bool = false
    var textfieldSuffix : String = ""

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 0) {
            Text(headingStaticText)
                .font(AppFonts.largeText)
                .padding(.top)
                .bold()
            
            
            if(!centerTopText.isEmpty){
                VStack{
                    Text(centerTopText)
                        .font(AppFonts.smallText)
                    itemSpacing()
                }
            }
            
            if(!centerBottomText.isEmpty){
                VStack{
                    Text(centerBottomText)
                        .font(AppFonts.smallText)
                    itemSpacing()
                }
            }
            
            HStack(spacing: 10){
                HStack{
                    itemSpacingWidth(width: 4)
                    DarkText(text: boldText, font: AppFonts.mediumText, fontWeight: .bold)
                }
                if(isTextField){
                    VStack(alignment : .trailing){
                        HStack(spacing: 0){
                            TextField("", text: $resultant)
                                .multilineTextAlignment(.trailing)
                            Text(textfieldSuffix)
                                .padding(CustomPadding.lHalfPadding)
                        }
                    }
                    .frame(width: 150)
                }else{
                    HStack{
                        itemSpacingWidth(width: 5)
                        DarkText(text: "\(DateTimeFunctions.onlyTimeReadable(selectedDate)) Z",font: AppFonts.mediumText)
                            .wrapInButton(action: {
                                showDatePopup = true
                            })
                            .popover(isPresented: $showDatePopup){
                                DatePicker("", selection: $selectedDate, displayedComponents: [.date,.hourAndMinute]
                                )
                                .datePickerStyle(.wheel)
                                .labelsHidden()
                            }
                        HStack(spacing: 0) {
                            
                            Image(systemName: SFIcons.minus)
                                .foregroundStyle(.mainBlue)
                                .frame(width: 50, height: 30)
                                .background(Color.black.opacity(0.1))
                                .roundedCorner(5, corners: [.topLeft, .bottomLeft])
                                .wrapInButton {
                                    selectedDate = Calendar.current.date(byAdding: .minute, value: -1, to: selectedDate) ?? selectedDate
                                }
                            
                            VerticalDivider(height: 2)
                            
                            Image(systemName: SFIcons.plus)
                                .foregroundStyle(.mainBlue)
                                .frame(width: 50, height: 30)
                                .background(Color.black.opacity(0.1))
                                .roundedCorner(5, corners:  [.topRight, .bottomRight])
                                .wrapInButton {
                                    selectedDate = Calendar.current.date(byAdding: .minute, value: 1, to: selectedDate) ?? selectedDate
                                }
                        }
                    }
                }
                
                
                
            }
                .frame(width: width, height : 40)
                .background(.dWhite)
                .cornerRadius(5)
                .shadow(radius: 1)
            
            itemSpacing()
            VStack(spacing: 0){
                
                Divider()
                    .frame(width: width + 32)
                
                HStack{
                    
                    ButtonText(text: leftBtnText)
                        .frame(width: width / 2)
                        .wrapInButton {
                            leftBtnAction()
                            CustomAlertManager.shared.isAlertPresented = false
                        }
                    
                    Divider()
                        .frame(height: 45)
                    
                    ButtonText(text: rightBtnText)
                        .frame(width: width / 2)
                        .wrapInButton {
                            rightBtnAction()
                            CustomAlertManager.shared.isAlertPresented = false
                        }

                }
            }
            .frame(height: 45)
            
        }
        .background(.alert)
        .cornerRadius(10)
        .shadow(radius: 1)
        .frame(width: 275, height: 600)
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
    }
}

#Preview{
    CustomAlertDateSelection()
}
