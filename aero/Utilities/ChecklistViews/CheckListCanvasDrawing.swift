//
//  CheckListCanvasDrawing.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/09/24.
//

import SwiftUI

struct CheckListCanvasDrawing: View {
    
    @State  var lines: [Line] = []
    @State var isRemoveDrawing: Bool = false;
    var text : String
    var isApplicable : Bool = true;
    var body: some View {
        NavigationStack{
            
            HStack{
                NavigationLink{
                    CanvasDrawingBoxScreen(lines: $lines, isRemoveDrawing: $isRemoveDrawing)
                }label:{
                    TextTextIconHStack(leftText: text, rightText: lines.isEmpty ? "" : "Added", leftOpacity: isApplicable ? 1 : AppConstants.defaultOpacity);
                }
                .disabled(!isApplicable)
            }
        }
        .background(.dWhite)
        .frame(height: Dimensions.defaultRowHeight)
    }
}
