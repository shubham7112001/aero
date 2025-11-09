//
//  CloudsAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI



struct CloudsAtisFlightProgressView: View {
    @State var itemCount : Int = 0
    
    @Binding var resultant : String
    @Binding var isReset : Bool
    
    @State var selectedCavok : String?
    @State var selectedFew : String?
    
    @State var updated : String = ""
    @State private var viewModels: [CloudsAtisViewModel] = []
    
    @State private var isUpdating: Bool = false
    
    @State private var previous : String?
    
    @State private var isSelectedCavokEnable : Bool = false
    
    var body: some View {
        VStack{
            CapitalizedTextHalfOpacity(text: "CLOUDS [h ft]", font: AppFonts.atisCapitalizedFont, isCapitalized: false)
            
            HStack{
                CustomGridText(data: ArrayTexts.cloudsAtisCavokList,isSpacer: false, selectedData: $selectedCavok)
                CustomGridText(data: ArrayTexts.cloudsAtisFewList, selectedBgColor: .dWhite, prefix : "+", selectedData: $selectedFew)
                    
            }
            
            VStack(spacing : 0){
                
                    VStack{
                            ForEach(Array(viewModels.enumerated()), id: \.element.id) { index, viewModel in
                                CloudsAtisFlightProgressInternalView(
                                    viewModel: viewModel,
                                    updated: $updated,
                                    onRemove: {
                                        print(index);
                                        viewModels.remove(at: index)
                                        itemCount = viewModels.count
                                    }
                                )
                            }
                }
            }
            .onChange(of: selectedFew) {
                print("Selected Few Called");
                if(selectedFew != nil){
                    isSelectedCavokEnable = false
                    previous = selectedFew
                }
                if(!isSelectedCavokEnable){
                    if  itemCount < 5 && previous != nil{
                        let newViewModel = CloudsAtisViewModel()
                        newViewModel.selectedFew = previous!
                        viewModels.append(newViewModel)
                        itemCount = viewModels.count
                    }
                }
            }
            .onChange(of: isReset){resetToInitialState()}
            .onChange(of: itemCount){
                    updateResultant()
            }
            .onChange(of : updated){
                updateResultant()
            }
            .onChange(of : selectedCavok){
                if(selectedCavok != nil){
                    isSelectedCavokEnable = true
                    previous = nil
                    viewModels = []
                    itemCount = 0
                    selectedFew = nil
                    
                }
                
                updateResultant()
            }
        }
        .frame(width: Dimensions.customSheetWidth)
        
    }
    private func resetToInitialState() {
        itemCount = 0
        selectedCavok = nil
        selectedFew = nil
        updated = ""
        viewModels = []
        isUpdating = false
        previous = nil
        isSelectedCavokEnable = false
    }
    
    private func updateResultant() {
        guard !isSelectedCavokEnable else{
            resultant = selectedCavok ?? ""
            return
        }
        selectedCavok = nil
        guard !isUpdating else { return }
            isUpdating = true

        resultant = viewModels
            .map { viewModel in
                let val1 = Int(viewModel.selectedFirst100to200 ?? "")
                let val2 = Int(viewModel.selected1090 ?? "")
                let val3 = Int(viewModel.selected1to9 ?? "")
                var finalVal = 0
                
                let isAllNil = viewModel.selectedFirst100to200 == nil &&
                                           viewModel.selected1090 == nil &&
                                           viewModel.selected1to9 == nil
                
                if(!isAllNil){
                    finalVal = (val1 ?? 0) + (val2 ?? 0) + (val3 ?? 0)
                }
                
                
                let base = isAllNil ? "000" : "\(String(format: "%03d", finalVal))"
                
                
                let result = "\(viewModel.selectedFew ?? "FEW")\(base)\(viewModel.selectedCbTcu ?? "")"
                
                return result
            }
            .filter { !$0.isEmpty }
            .joined(separator: " ")

            isUpdating = false
    }
}

#Preview {
    CloudsAtisFlightProgressView(resultant: .constant(""), isReset: .constant(false))
}


struct CloudsAtisFlightProgressInternalView: View {
    
    @ObservedObject var viewModel: CloudsAtisViewModel
    @Binding var updated : String
    var onRemove: () -> Void
    
    var body: some View {
        HStack(alignment: .top){
                CustomGridText(data: [viewModel.selectedFew ?? "FEW"],isSpacer: false, selectedData: $viewModel.selectedFew)
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded {
                                onRemove()
                            }
                    )
            
            VStack{
                CustomGridText(data: ["100","200"], isSpacer: false, selectedData: $viewModel.selectedFirst100to200)
                CustomGridText(data: ["CB","TCU"],isSpacer: false, selectedData: $viewModel.selectedCbTcu)
                
            }
            VStack{
                CustomGridText(data: ArrayTexts.number1090, selectedData: $viewModel.selected1090)
                CustomGridText(data: ArrayTexts.listOfNumbers(start: 1, end: 9, difference: 1), selectedData: $viewModel.selected1to9)
                
            }
            Spacer()
        }
        .onChange(of : viewModel.cnt){
            updated = "\(viewModel.cnt)"
        }
    }
}

class CloudsAtisViewModel: ObservableObject, Identifiable {
    @Published var selectedFew : String?
    @Published var selectedFirst100to200: String?
    @Published var selectedCbTcu: String?
    @Published var selected1090: String?
    @Published var selected1to9: String?
    let id = UUID()
    var cnt: Int {
        return Int.random(in: 1...100000000)
    }
}
