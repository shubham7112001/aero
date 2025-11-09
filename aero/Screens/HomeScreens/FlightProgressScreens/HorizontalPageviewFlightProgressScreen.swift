//
//  HorizontalPageviewFlightProgressScreen.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct HorizontalPageviewFlightProgressScreen: View {
    
    @State private var toggleBtn : Bool = false
    @State private var showAlert = false
    
    @State var alertHeading : String = "STAR Procedure"
    @State var inputText : String = ""
    
    @State var showAtisSheet : Bool = false;
    @State var atisText : String = ""
    
    @State var atisTexts: [String] = Array(repeating: "", count: 12)
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            Color(.mediumLightGrey)
            VStack{
                TabView{
                    
                    HStack(){
                        itemSpacingWidth()
                        IconImage(content: .systemImage(SFIcons.star))
                        itemSpacingWidth()
                        DoubleTextVstack(topText: AppTexts.altsel, bottomText: "O ft")
                        DoubleTextVstack(topText: AppTexts.pri1, bottomText: "O ft")
                        DoubleTextVstack(topText: AppTexts.pri2, bottomText: "O ft")
                        DoubleTextVstack(topText: AppTexts.landTemp, bottomText: "O \(AppTexts.degreeSymbol)C")
                        DoubleTextVstack(topText: AppTexts.tOTemp, bottomText: "O \(AppTexts.degreeSymbol)C")
                        DoubleTextVstack(topText: AppTexts.alt2rvr, bottomText: "O m")
                    }
                    .wrapInButton{
                        alertHeading = "PRI 2"
                        showAlert = true
                        
                    }
                    
                    HStack{
                        itemSpacingWidth()
                        VStack{
                            HorizontalReverseSFSymbol(sysImg: SFIcons.cloudSun)
                            LightWhiteText(text: "ATIS")
                        }
                        Text(atisText)
                            .foregroundStyle(.dWhite)
                        Spacer()
                        
                        DoubleTextVstack(isSpacer: false, topText: "Departure", bottomText: "GCRR")
                        itemSpacingWidth()
                    }
                    .wrapInButton {
                        showAtisSheet = true;
                    }
                    
                    HStack{
                        itemSpacingWidth()
                        
                        IconImage(content: .systemImage(SFIcons.arrowUpForward))
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                        
                        DoubleTextVstack(topText: "SID : GCRR", bottomText: "LARYS1M")
                        
                        
                        
                        
                            HStack{
                                DoubleTextVstack(isSpacer: false, topText: "SID", bottomText: "STAR")
                                VerticalToggleBtn(isOn: $toggleBtn)
                            }
                            .wrapInButton{
                                toggleBtn.toggle()
                            }
                        
                        itemSpacingWidth()
                        
                        
                        
                    }
                    .wrapInButton{
                        alertHeading = "STAR Procedure"
                        showAlert = true
                    }
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            }
        }
        .frame(height: 75)
        .formSheet(isPresented: $showAtisSheet){
            AtisSheetFlightProgress(showAtisSheet: $showAtisSheet,  atisTexts: $atisTexts)
        }
        
        .alert(alertHeading, isPresented: $showAlert) {
            
            TextField("", text: $inputText)
            Button("Ok", role: .cancel) { }
        }
        .onChange(of: atisTexts){updateResultant()}
        .onChange(of: showAtisSheet){
            print(showAtisSheet)
        }
    }
    
    private func updateResultant() {
        DispatchQueue.main.async(){
            atisText = atisTexts.filter { !$0.isEmpty }.joined(separator: " ")
        }
    }
        
}

#Preview {
    HorizontalPageviewFlightProgressScreen()
}

