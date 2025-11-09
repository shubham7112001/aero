//
//  OperationTypeModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 04/09/24.
//

import Foundation
import SwiftData

@Model
class OperationTypeModel{
    var scheduled: String?
    var commercial: String?
    var ifrVfr: String?
    var operations: String?
    
    init(scheduled: String? = nil, commercial: String? = nil, ifrVfr: String? = nil, operations: String? = nil) {
        self.scheduled = scheduled
        self.commercial = commercial
        self.ifrVfr = ifrVfr
        self.operations = operations
    }
    
}
