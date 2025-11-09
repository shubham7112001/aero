//
//  ChecklistScreens.swift
//  taillog
//
//  Created by Shubham Tiwari on 19/09/24.
//

import SwiftUI


enum ChecklistTypes{
    case check
    case onOff
    case shortText
    case longText
    case number
    case single
    case multiple
    case date
    case time
    case dateTime
    case singlePhoto
    case multiplePhoto
    case drawing
    case headline
}

struct ChecklistItem: Hashable {
    
    let title: String
    let type: ChecklistTypes
}

struct ChecklistScreens: View {
    
    @State private var isApplicable = false;
    @State var timePicker: Date = Date()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.veryLightGrey)
                
                VStack(spacing: 0){
                    HeadingInternalScreenOfpScreen(leftText: AppTexts.preFlightAcceptance, centerText: "[CHECKLIST NAME]")
                    
                    ScrollView{
                        sectionSpacing()
                        
                        VStack(spacing :0 ){
                            
                            TextWIthToggleSwitch(text: "Checklist applicable", isOn: $isApplicable)
                            
                            itemSpacing()
                            
                            ForEach(Array(MockDataFile.checklistItems.enumerated()), id: \.element) { index, item in
                                
                                VStack(spacing: 0){
                                    switch item.type {
                                        
                                        case .check:
                                        CheckListOnlyCheck(checklistNumber: index + 1, text: AppTexts.sampleVeryLargeText, isApplicable: isApplicable)
                                        
                                        case .onOff:
                                        ToggleSwitch(text: "Checklist item \(index + 1)", isApplicable: isApplicable)
                                        
                                        case .shortText:
                                        CheckListSingleLineField(text: "Checklist item \(index + 1)",isApplicable: isApplicable)
                                        
                                        case .longText:
                                        ChecklistMultipleLineField(checkListNumber: index + 1, isApplicable : isApplicable)
                                        
                                        case .number:
                                        CheckListNumber(text: "197364", suffixNumber: 10, isApplicable : isApplicable)
                                        
                                        case .date:
                                        CheckListDateSelection(text: "Checklist item \(index + 1)",isApplicable: isApplicable)
                                        
                                        case .time:
                                        CustomTimePicker(time: $timePicker, text: "Checklist item \(index + 1)", isApplicable : isApplicable)
                                        
                                        case .dateTime:
                                        CustomDateTimePicker(text: "Checklist item \(index + 1)", isApplicable : isApplicable)
                                        
                                        case .singlePhoto:
                                        CheckListSinglePhoto(text : "Cheklist item \(index + 1)", isApplicable : isApplicable)
                                        
                                        case .multiplePhoto:
                                        CheckListMultiplePhoto(checkListNumber: index + 1, isApplicable : isApplicable)
                                        
                                        case .drawing:
                                        CheckListCanvasDrawing(text: "Checklist item \(index + 1)", isApplicable : isApplicable)
                                        
                                        case .headline:
                                            CheckListCapitalSpacing(checkListNumber: index + 1)
                                        
                                        case .single:
                                        CustomPopoverPicker(checklistNumber: index + 1, list: MockDataFile.sampleItems, isApplicable : isApplicable)
                                        
                                        case .multiple:
                                        ChecklistMultipleItems(checklistNumber: index + 1, list: MockDataFile.sampleItems, isApplicable : isApplicable)
                                            
                                        
                                    }
                                    
                                    if(item.type != .headline){
                                        Divider().padding(CustomPadding.lPadding)
                                    }
                                    
                                }
                                .background(.dWhite)
                            }
                            
                            
                        }
                    
                        
                        
                        Spacer()
                    }
                }
            }
        }
        .frame(width: Dimensions.navigationSplitViewDetailWidth)
        .ignoresSafeArea()
    }
}

struct ChecklistScreens_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistScreens()
    }
}
