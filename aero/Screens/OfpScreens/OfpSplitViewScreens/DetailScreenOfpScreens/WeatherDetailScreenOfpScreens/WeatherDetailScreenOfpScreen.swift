//
//  WeatherDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct WeatherDetailScreenOfpScreen: View {
    @State private var selectedSegmentItems : WeatherSegmentTextOfpScreen = WeatherSegmentTextOfpScreen.all[0]
    @State var enRoute : String = "";
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.veryLightGrey)
                VStack(spacing : 0){
                    HeadingTextNavigationSplitView(text: AppTexts.weather)
                    VStack(spacing : 0){
                        ScrollView{
                            sectionSpacing()
                            VStack(spacing : 2){
                                
                                PdfViewerRow(text: AppTexts.windTemperature)
                                
                                HorizontalDividerDetailScreenNavigationSplitView(multiple: Dimensions.dividerContentSpacing)
                                
                                PdfViewerRow(text: AppTexts.significantWeather)
                                
                                HorizontalDividerDetailScreenNavigationSplitView(multiple: Dimensions.dividerContentSpacing)
                                
                                PdfViewerRow(text: AppTexts.verticalCrossSection)
                                
                                HorizontalDividerDetailScreenNavigationSplitView(multiple: Dimensions.dividerContentSpacing)
                                
                                PdfViewerRow(text: AppTexts.sigmetCap)
                                
                                HorizontalDividerDetailScreenNavigationSplitView()
                                
                            }
                            .background(.dWhite)
                            
                            itemSpacing()
                            
                            NavigationLink{
                                TextFieldScreen(centerHeadingText: "En-route", leftText: "Weather", input: $enRoute)
                            }label:{
                                IconTextDetailSplitNavigationView(text: AppTexts.enRoute)
                            }
                            itemSpacing()
                            
                            AppSegmentedPicker(selectedItem: $selectedSegmentItems, items: WeatherSegmentTextOfpScreen.all,width: Dimensions.screenWidth * 0.5)
                            
                            itemSpacing()
                            
                            
                        }
                    }
                    .frame(height: Dimensions.screenHeight * 0.3)
                    
                    VStack(spacing : 0){
                        ScrollView{
                            sectionSpacing()
                            
                            CapitalizedTextHalfOpacity(text: AppTexts.metarTafCap)
                            
                            CustomHeightSpacer(height: 5)
                            
                            TextDividerTextVstack(upperText: "100550Z 13006KT CAVOK 16/10 Q1023 NOSIG=", lowerText: "100530Z 1006/1106 13007KT CAVOK PROB40 1014/1020 12015G25KT TEMPO 1021/1104 SHRA BKN030CB BECMG 1104/1106 BKN006==")
                            
                            sectionSpacing()
                            
                            CapitalizedTextHalfOpacity(text: AppTexts.atisCap)
                            
                            CustomHeightSpacer(height: 5)
                            
                            VStack{
                                TextWithAutoAdjustments(text: "")
                            }
                            .frame(minHeight: Dimensions.screenHeight * 0.15)
                            .background(.dWhite)
                            
                        }
                        
                    }
                    Spacer()
                    
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    WeatherDetailScreenOfpScreen()
}
