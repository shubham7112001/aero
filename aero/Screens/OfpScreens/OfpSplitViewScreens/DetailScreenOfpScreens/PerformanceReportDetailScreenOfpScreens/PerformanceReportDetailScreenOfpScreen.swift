//
//  PerformanceReportDetailScreenOfpScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/07/24.
//

import SwiftUI

struct PerformanceReportDetailScreenOfpScreen: View {
    var body: some View {
        ZStack{
            Color(.veryLightGrey)
            VStack(alignment : .leading,spacing : 0){
                HeadingTextNavigationSplitView(text: AppTexts.performanceReports)
                ScrollView{
                    sectionSpacing()
                    
                    LeftColoredText(text : "Update reports",color: .blue)
                    
                    HStack{
                        itemSpacingWidth()
                        Text("Internet access must be available to update performance reports.").opacity(AppConstants.defaultOpacity)
                            .padding(.vertical, Dimensions.defaultPadding)
                        
                        Spacer()
                    }
                    
                    
                    VStack(spacing : 0){
                        
                        PdfViewerRow(text: "Load manifest",actions: [
                            IconImage(content: .systemImage(SFIcons.rightChevron),color: Color.gray).toAnyView()
                        ])
                        
                        HorizontalDividerDetailScreenNavigationSplitView(multiple: Dimensions.dividerContentSpacing)
                        
                        PdfViewerRow(text: "Runway analysis report",actions: [
                            IconImage(content: .systemImage(SFIcons.rightChevron),color: Color.gray).toAnyView()
                        ])
                        
                    }
                    .background(.white)
                    
                    itemSpacing()
                    
                    Text("The performance reports must be generated via the CrewBriefing APG module prior to the flight.").opacity(AppConstants.defaultOpacity)
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
    }
}

#Preview {
    PerformanceReportDetailScreenOfpScreen()
}
