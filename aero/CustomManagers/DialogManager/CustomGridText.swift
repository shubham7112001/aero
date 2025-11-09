//
//  CustomGridText.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct CustomGridText: View {
    var data: [String]
    var data2 : [String] = []
    var fixedHeight: CGFloat = 32
    var minWidth : CGFloat = 32
    var bgColor : Color = .dWhite
    var isSpacer : Bool = true;
    var isContain : Bool = false
    var selectedBgColor : Color?
    var disabledItems: Set<String> = []
    var isMultipleSelection : Bool = false;
    var mulitpleSelectedItems : [String] = []
    var prefix : String = ""
    
    @Binding var selectedData : String?
    
    var body: some View {
            VStack(alignment: .leading, spacing: CustomPadding.defaultPadding - 2) {
                createHStack(for: data)

                if !data2.isEmpty {
                    createHStack(for: data2)
                }
            }
            .padding(CustomPadding.lPadding)
        }

        private func createHStack(for items: [String]) -> some View {
            HStack(spacing: CustomPadding.defaultPadding - 4) {
                ForEach(items.indices, id: \.self) { index in
                    let item = items[index]
                    let itemWithPrefix = prefix + item
                    HStack {
                        Text(itemWithPrefix)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .font(AppFonts.smallText)
                            .padding(.horizontal, 4)
                            .foregroundStyle(selectedData?.split(separator: " ").contains(where: { $0 == item }) == true && selectedBgColor == nil ? .dWhite : .black)
                    }
                    .frame(minWidth: minWidth, maxWidth: isContain ? .infinity : nil, minHeight: fixedHeight, maxHeight: fixedHeight)
                    .background(selectedData?.split(separator: " ").contains(where: { $0 == item }) == true ? selectedBgColor == nil ? .main : .dWhite : bgColor)
                    .cornerRadius(4)
                    .opacity(disabledItems.contains(item) ? AppConstants.defaultOpacity : 1)
                    .disabledItem(isDisabled: disabledItems.contains(item))
                    .onTapGesture {
                        handleSelection(for: item)
                    }
                }
                if isSpacer {
                    Spacer()
                }
            }
        }

        private func handleSelection(for item: String) {
            if isMultipleSelection {
                var selectedItems: [String] = selectedData?.split(separator: " ").map { String($0) } ?? []

                    if selectedItems.contains(item) {
                        selectedItems.removeAll { $0 == item }
                    } else {
                        selectedItems.append(item)
                    }

                    let allItems = data + data2
                    selectedItems.sort { allItems.firstIndex(of: $0)! < allItems.firstIndex(of: $1)! }

                    selectedData = selectedItems.isEmpty ? nil : selectedItems.joined(separator: " ")
            } else {
                selectedData = selectedData == item ? nil : item
            }
        }
    }

#Preview {
    CustomGridText(data: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L","M","N"],data2:["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L","M","N"],
                      
                   fixedHeight: 50, selectedData: .constant("data"))
                .frame(height: 300)
}

extension View {
    func disabledItem(isDisabled: Bool) -> some View {
        self
            .allowsHitTesting(!isDisabled)
    }
}
