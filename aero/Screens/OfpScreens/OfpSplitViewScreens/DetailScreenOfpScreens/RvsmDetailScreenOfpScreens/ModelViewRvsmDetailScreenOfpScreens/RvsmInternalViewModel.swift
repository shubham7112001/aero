//
//  RvsmInternalViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 30/12/24.
//

import Foundation

class RvsmInternalViewModel: ObservableObject{
    
    @Published var capitalText: String
    @Published var altSel: String
    @Published var pri1: String
    @Published var pri2: String
    @Published var sbyAlt: String
    var isDisabled: Bool
    
    // Custom initializer to set default values
    init(capitalText: String = "", altSel: String = "0", pri1: String = "0", pri2: String = "0", sbyAlt: String = "0", isDisabled: Bool = false) {
        self.capitalText = capitalText
        self.altSel = altSel
        self.pri1 = pri1
        self.pri2 = pri2
        self.sbyAlt = sbyAlt
        self.isDisabled = isDisabled
    }
}
