//
//  RvsmOfpViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 30/12/24.
//

import Foundation

class RvsmOfpViewModel: ObservableObject{
    @Published var selectedRvsmCheckTypes: Int{
        didSet{
            isDisabled = selectedRvsmCheckTypes == 2
        }
    }
    @Published var takeOffElevation: String
    @Published var isDisabled: Bool
    init(selectedRvsmCheckTypes: Int = 0, takeOffElevation: String = "0", isDisabled: Bool = false) {
        self.selectedRvsmCheckTypes = selectedRvsmCheckTypes
        self.takeOffElevation = takeOffElevation
        self.isDisabled = isDisabled
    }
    
    let checkTypeList: [String] = ["Altimeter", "RVSM", "Disable"]
}
