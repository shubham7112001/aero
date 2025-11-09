//
//  DeicingStepModels.swift
//  taillog
//
//  Created by Shubham Tiwari on 30/08/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class DeicingStepModel{
    var type: String?
    var mixture: String?
    var supplier: CGFloat?
    
    init(type: String? = nil, mixture: String? = nil, supplier: CGFloat? = nil) {
        self.type = type
        self.mixture = mixture
        self.supplier = supplier
    }
    
    
    static let mockDeicingStepModel = DeicingStepModel(
        type: "Anti-Icing",
        mixture: "Type I",
        supplier: 75.0
    )
}
