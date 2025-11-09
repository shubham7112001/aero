//
//  PrimaryScreenConfigurationScreens.swift
//  taillog
//
//  Created by Sword Software on 08/07/24.
//

import SwiftUI



struct PrimaryScreenConfigurationScreens: View {
    @Binding  var selectedBtn : PrimaryScreenConfigurationScreenSelection;
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            
                VStack(spacing:0){
                    HeadingTextNavigationSplitView(text: AppTexts.settings)
                    ScrollView {
                    sectionSpacing()
                    
                    Button{
                        selectedBtn = PrimaryScreenConfigurationScreenSelection.userAdmin
                    }label: {
                        PrimaryViewModelNavigationSplitView(imgSF:SFIcons.personfill, iconBGColor: .lightAccentBlue, text: AppTexts.userAdministration,
                                                            bgColor: selectedBtn == PrimaryScreenConfigurationScreenSelection.userAdmin ? .mainBlue : .white, isTextWhite: selectedBtn == PrimaryScreenConfigurationScreenSelection.userAdmin ? true : false)
                        
                    }
                    itemSpacing()
                    
                    VStack(spacing : 0){
                        Button{
                            selectedBtn = PrimaryScreenConfigurationScreenSelection.sysParams
                        }label: {
                            PrimaryViewModelNavigationSplitView(imgSF: SFIcons.gearshape, iconBGColor: .lightAccentBlue, text: AppTexts.systemParameters,bgColor: selectedBtn == PrimaryScreenConfigurationScreenSelection.sysParams ? .mainBlue : .white,isTextWhite: selectedBtn == PrimaryScreenConfigurationScreenSelection.sysParams ? true : false)
                        }
                        
                        
                        HorizontalDividerPrimaryScreenNavigationSplitView()
                        
                        Button{
                            selectedBtn = PrimaryScreenConfigurationScreenSelection.repRetention
                        }label: {
                            PrimaryViewModelNavigationSplitView(imgSF: SFIcons.rectangleStack, iconBGColor: .pink, text: AppTexts.reportingRetention, bgColor: selectedBtn == PrimaryScreenConfigurationScreenSelection.repRetention ? .mainBlue : .white , isTextWhite: selectedBtn == PrimaryScreenConfigurationScreenSelection.repRetention ? true : false)
                        }
                    }
                    .background(.white)
                    
                    Spacer()
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewPrimaryWidth)
    }
    
    
}

#Preview {
    PrimaryScreenConfigurationScreens(selectedBtn: .constant(PrimaryScreenConfigurationScreenSelection.userAdmin))
}
