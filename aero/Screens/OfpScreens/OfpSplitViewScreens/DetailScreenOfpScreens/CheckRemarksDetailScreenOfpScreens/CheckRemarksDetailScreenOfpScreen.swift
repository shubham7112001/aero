//
//  CheckRemarksDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/07/24.
//

import SwiftUI

struct CheckRemarksDetailScreenOfpScreen: View {
    @State private var showSheet : Bool = false
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in 
                ZStack{
                    Color(.veryLightGrey)
                    VStack(spacing : 0){
                        HeadingTextNavigationSplitView(text: AppTexts.checkRemarks, actions: [
                            IconImage(content: .systemImage(SFIcons.squareAndArrowUp),size: 25).toAnyView()
                        ])
                        ScrollView{
                            sectionSpacing()
                            
                            DividerWithActionsVstack(actions: [
                                Button{
                                    showSheet = true
                                }label:{
                                    TextWithActions(text: AppTexts.generalRemarksPhoto, actions: [
                                        Image(systemName: SFIcons.cameraFill)
                                            .opacity(AppConstants.defaultOpacity)
                                            .toAnyView(),
                                        
                                        Image(systemName: SFIcons.rightChevron)
                                            .opacity(AppConstants.defaultOpacity)
                                            .toAnyView()
                                    ])
                                    
                                }.toAnyView(),
                               
                                NavigationLink{
                                    TechLogRemarksOfpScreen()
                                }label: {
                                    IconTextHStack(text: AppTexts.techLogRemarks)
                                }
                                    .toAnyView()
                                
                            ])
                            
                            itemSpacing()
                            
                            NavigationLink{
                                PreFlightAcceptanceCheckRemarksOfpScreen()
                            }label:{
                                TextWithActions(text: AppTexts.preFlightAcceptance, actions: [
                                    Image(systemName: SFIcons.multiply)
                                        .opacity(AppConstants.defaultOpacity)
                                        .foregroundStyle(.red)
                                        .toAnyView(),
                                    
                                    Image(systemName: SFIcons.rightChevron)
                                        .opacity(AppConstants.defaultOpacity)
                                        .toAnyView()
                                ])
                            }
                            .navigationBarTitleDisplayMode(.large)
                            .navigationBarBackButtonHidden()
                            
                            
                            sectionSpacing()
                            
                            CapitalizedTextHalfOpacity(text: AppTexts.checkListCap)
                            
                            CustomHeightSpacer(height: Dimensions.spaceBwItems / 2)
                            
                            TextWithActions(text: AppTexts.manageViaAdminSystem, actions: [
                                
                                Text(AppTexts.checkCap)
                                    .opacity(0.5)
                                    .toAnyView(),
                                
                                Image(systemName: SFIcons.multiply)
                                    .opacity(0.5)
                                    .foregroundStyle(.red)
                                    .toAnyView(),
                                
                            ])
                            Spacer()
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet){
            
            NavigationStack {
                GeneralRemarksPhotosCheckRemarksOfpScreen()
                       }
                       .presentationDetents([.medium])
                       .presentationDragIndicator(.automatic)
                
        }
        
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CheckRemarksDetailScreenOfpScreen()
}
