//
//  FuelRefuellingOfpViewModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 31/12/24.
//

import SwiftUI

class FuelRefuellingOfpViewModel: ObservableObject{
    @Published var selectedImage: UIImage?
    @Published var receiptNo: String
    @Published var volumeLt: String
    @Published var volumeGal: String
    @Published var weight: String
    @Published var safPercentage: String
    @Published var densityKgLit: String
    @Published var densityLbGal: String
    @Published var selectedSuppliers: [String]
    @Published var selectedSupplier: String?
    @Published var inputSupplier = ""
    
    let suppliers: [String] = ["Air BP Sterlingcard", "World Fuel AVCARD", "Shell Aviation", "NF Fuel Release", "Contract", "Handling"]
    
    init(receiptNo: String = "", volumeLt: String = "" , volumeGal: String = "", weight: String = "", safPercentage: String = "", densityKgLit: String = "", densityLbGal: String = "", selectedSuppliers: [String] = [], selectedSupplier: String? = nil, selectedImage: UIImage? = nil, inputSupplier: String = "") {
        self.receiptNo = receiptNo
        self.volumeLt = volumeLt
        self.volumeGal = volumeGal
        self.weight = weight
        self.safPercentage = safPercentage
        self.densityKgLit = densityKgLit
        self.densityLbGal = densityLbGal
        self.selectedSuppliers = selectedSuppliers
        self.selectedSupplier = selectedSupplier
        self.selectedImage = selectedImage
        self.inputSupplier = inputSupplier
    }
    
}
