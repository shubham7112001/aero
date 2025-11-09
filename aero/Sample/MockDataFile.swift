//
//  MockDataFile.swift
//  taillog
//
//  Created by Shubham Tiwari on 19/09/24.
//

import SwiftUI

class MockDataFile{
    static let lineMockData : [Line] = [taillog.Line(
         points: [
            // Head
            CGPoint(x: 176.5, y: 173.0),
            CGPoint(x: 204.5, y: 166.5),
            CGPoint(x: 235.0, y: 158.5),
            
            // Neck and shoulders
            CGPoint(x: 260.0, y: 180.0),
            CGPoint(x: 288.0, y: 171.5),
            CGPoint(x: 280.0, y: 166.0),
            
            // Torso
            CGPoint(x: 215.5, y: 225.0),
            CGPoint(x: 184.0, y: 262.5),
            
            // Left Arm
            CGPoint(x: 201.5, y: 135.0),
            CGPoint(x: 220.0, y: 113.0),
            CGPoint(x: 247.5, y: 84.0),
            
            // Right Arm
            CGPoint(x: 244.0, y: 209.5),
            CGPoint(x: 265.5, y: 183.0),
            
            // Hips
            CGPoint(x: 303.5, y: 189.0),
            CGPoint(x: 316.0, y: 173.5),
            
            // Left Leg
            CGPoint(x: 195.5, y: 262.0),
            CGPoint(x: 171.5, y: 251.5),
            CGPoint(x: 160.0, y: 242.5),
            
            // Right Leg
            CGPoint(x: 256.0, y: 227.0),
            CGPoint(x: 244.0, y: 209.5),
            CGPoint(x: 238.5, y: 241.0)
        ]
,
         color: .black)]
    
    
    
    static let checklistItems: [ChecklistItem] = [
            ChecklistItem(title: "Check Item", type: .check),
            ChecklistItem(title: "On/Off Toggle", type: .onOff),
            ChecklistItem(title: "Short Text", type: .shortText),
            ChecklistItem(title: "Long Text", type: .longText),
            ChecklistItem(title: "Number Stepper", type: .number),
            ChecklistItem(title: "Single Choice", type: .single),
            ChecklistItem(title: "Multiple Choice", type: .multiple),
            ChecklistItem(title: "Date Picker", type: .date),
            ChecklistItem(title: "Time Picker", type: .time),
            ChecklistItem(title: "Headline", type: .headline),
            ChecklistItem(title: "Date & Time Picker", type: .dateTime),
            ChecklistItem(title: "Single Photo", type: .singlePhoto),
            ChecklistItem(title: "Multiple Photos", type: .multiplePhoto),
            ChecklistItem(title: "Drawing Item", type: .drawing)
            
        ]
    
    
    static let sampleItems : [String] = [
        "I’m not lazy, I’m on energy-saving mode.",
        "I'm on a seafood diet. I see food, I eat it.",
        "I told my WiFi we’re through. It wouldn’t connect.",
        "Why don’t skeletons fight? They don’t have guts.",
        "If Cinderella’s shoe fit, why did it fall off?",
        "My bed is a magical place, I suddenly remember things.",
        "I can’t adult today. Tomorrow doesn’t look good either.",
        "Running late is my cardio.",
        "Why did the tomato blush? It saw the salad dressing.",
        "I’m on a whiskey diet. I lost three days already!"
    ]
    
    static let samplePdf : String = "/Users/mac28/Desktop/2985_1717072674_MdNdvR_38971589_sigmet.pdf";

}
