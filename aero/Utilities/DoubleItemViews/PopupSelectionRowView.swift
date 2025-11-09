//
//  PopupSelectionRow.swift
//  taillog
//
//  Created by Shubham Tiwari on 16/12/24.
//

import SwiftUI

class PopupSelectionRowViewModel: ObservableObject{
    var leftText : String
    @Binding var selected : Int
    @Published var showPopover : Bool = false
    
    var dataList : [String]
    
    init(leftText: String, selected: Binding<Int>, dataList: [String]) {
        self.leftText = leftText
        self._selected = selected
        self.dataList = dataList
    }
}
struct PopupSelectionRowView: View {
    @ObservedObject var viewModel : PopupSelectionRowViewModel
    
    var body: some View {
        VStack{
            TextTextHStack(leftText: viewModel.leftText, rightText: viewModel.dataList.isEmpty ? "" : viewModel.dataList[viewModel.selected],rightOpacity: true)
                .popover(isPresented: $viewModel.showPopover, content: {
                    VStack(spacing: 0){
                        
                        Picker("", selection: $viewModel.selected){
                            ForEach(0 ..< viewModel.dataList.count, id: \.self){index in
                                Text(viewModel.dataList[index])
                                    .tag(index)
                            }
                        }
                        .pickerStyle(.wheel)
                        .padding()
                    }
                    .frame(width: 300, height: 200)
                }
                         
                )
        }
        .frame(height: Dimensions.defaultRowHeight)
        .background(.dWhite)
        .wrapInButton {
            viewModel.showPopover = true
        }
    }
}

#Preview {
    PopupSelectionRowView(viewModel: PopupSelectionRowViewModel(leftText: "Left Text", selected: .constant(0), dataList: ["asd", "asdsdf", "asfasdfasf"]))
}
