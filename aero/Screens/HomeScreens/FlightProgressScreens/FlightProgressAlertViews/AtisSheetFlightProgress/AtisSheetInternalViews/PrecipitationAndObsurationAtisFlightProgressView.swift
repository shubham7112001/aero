//
//  PrecipitationAndObsurationAtisFlightProgressView.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/09/24.
//

import SwiftUI

struct PrecipitationAndObsurationAtisFlightProgressView: View {
    @State var itemCount : Int = 0;
    @Binding var isReset : Bool
    @Binding var resultant : String
    @State var viewModelResultant : String = ""
    
    @State var selectedPrecipitation : String?
    @State var previousSelected : String?
    
    @State private var viewModels : [PrecipitationAndObsurationViewModel]  = []
    
    @StateObject private var viewModel = PrecipitationAndObsurationViewModel()
    @State private var viewModelsResultant : [String] = []
    
    @State private var isUpdating: Bool = false
    
    var body: some View {
        VStack(spacing : Dimensions.defaultPadding - 1){
            HStack{
                CapitalizedTextHalfOpacity(text: "precipitation", font: AppFonts.atisCapitalizedFont)
                CapitalizedTextHalfOpacity(text: "obscuration",font: AppFonts.atisCapitalizedFont)
            }
            CustomGridText(data: ArrayTexts.precipitationAndObsurationAtisList, selectedBgColor: .white, prefix : "+" ,selectedData: $selectedPrecipitation )
                
            
            
            VStack{
                ForEach(Array(viewModels.enumerated()), id: \.element.id) { index, viewModel in
                    PrecipitationAndObsurationAtisFlightProgressIinternalView(
                        viewModel: viewModel,
                        resultant : $viewModelResultant,
                        onRemove: {
                            viewModels.remove(at: index)
                            itemCount = viewModels.count
                            viewModelsResultant.remove(at: index)
                        }
                    )
                }
            }
            
        }
        .frame(width: Dimensions.customSheetWidth)
        .onChange(of : selectedPrecipitation ){
            if(selectedPrecipitation != nil){
                previousSelected = selectedPrecipitation
            }
            if viewModels.count < 5 && previousSelected != nil {
                let newViewModel = PrecipitationAndObsurationViewModel()
                newViewModel.selectedDZ = previousSelected
                viewModels.append(newViewModel)
                viewModelsResultant.append(previousSelected ?? "")
                itemCount = viewModels.count
            }
            
        }
        .onChange(of: isReset){
            resetToInitialState()
        }
        .onChange(of : viewModelResultant){
            updateResultant()
        }
        .onChange(of : itemCount){
            updateResultant()
        }
    }
    
    private func resetToInitialState() {
        DispatchQueue.main.async{
            itemCount = 0
            viewModels = []
            resultant = ""
            viewModelResultant = ""
            selectedPrecipitation = nil
            previousSelected = nil
            
            viewModelsResultant = []
            isUpdating = false
        }
    }
    private func updateResultant() {
        guard !isUpdating else { return }
        isUpdating = true
        resultant = viewModels
            .map { viewModel in
                let result = [
                    viewModel.selectedLightHeavy == nil ? "" : (viewModel.selectedLightHeavy == "Light" ? "-" : "+"),
                    viewModel.selectedVC ?? "",
                    viewModel.selectedSubList ?? "",
                    viewModel.selectedDZ ?? ""
                ]
                .filter { !$0.isEmpty }
                .joined(separator: "")

                return result
            }
            .joined(separator: " ")
        
        isUpdating = false
    }
}

#Preview {
    PrecipitationAndObsurationAtisFlightProgressView(isReset: .constant(false), resultant: .constant(""))
}

struct PrecipitationAndObsurationAtisFlightProgressIinternalView : View {
   
    @ObservedObject var viewModel: PrecipitationAndObsurationViewModel
    @Binding var resultant : String
    @State var tapCnt : Int = 0
    var onRemove: () -> Void
    
    
    var body: some View {
            HStack {
                CustomGridText(data: ["Light", "Heavy"], isSpacer: false, selectedData: $viewModel.selectedLightHeavy)
                CustomGridText(data: ["VC"], isSpacer: false, selectedData: $viewModel.selectedVC)
                CustomGridText(data: ArrayTexts.precipitationAndObsurationAtisSubList, isSpacer: false, selectedData: $viewModel.selectedSubList)
                CustomGridText(data: [viewModel.selectedDZ ?? "DZ"], selectedData: $viewModel.selectedDZ)
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded {
                                onRemove()
                            }
                    )
        }
            .onChange(of : viewModel.cnt){
                
                resultant = "\(viewModel.cnt)"
            }
    }

}

class PrecipitationAndObsurationViewModel: ObservableObject, Identifiable{
    @Published var selectedLightHeavy: String?
    @Published var selectedVC: String?
    @Published var selectedSubList: String?
    @Published var selectedDZ: String?
    
    var cnt: Int {
        return Int.random(in: 1...100000000) 
    }
}
